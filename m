From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 04/12] soc: qcom: ipa: immediate commands
Date: Wed, 7 Nov 2018 15:36:50 +0100
Message-ID: <CAK8P3a3iKshE3yCG477AeZbKbLtpDwMhn5mfLySFRLOLmUv5AQ@mail.gmail.com>
References: <20181107003250.5832-1-elder@linaro.org> <20181107003250.5832-5-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181107003250.5832-5-elder@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Alex Elder <elder@linaro.org>
Cc: David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, syadagir@codeaurora.org, mjavid@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2018 at 1:33 AM Alex Elder <elder@linaro.org> wrote:
>
> +/**
> + * struct ipahal_context - HAL global context data
> + * @empty_fltrt_tbl:   Empty table to be used for table initialization
> + */
> +static struct ipahal_context {
> +       struct ipa_dma_mem empty_fltrt_tbl;
> +} ipahal_ctx_struct;
> +static struct ipahal_context *ipahal_ctx = &ipahal_ctx_struct;

Remove the global variables here

> +/* Immediate commands H/W structures */
> +
> +/* struct ipa_imm_cmd_hw_ip_fltrt_init - IP_V*_FILTER_INIT/IP_V*_ROUTING_INIT
> + * command payload in H/W format.
> + * Inits IPv4/v6 routing or filter block.
> + * @hash_rules_addr: Addr in system mem where hashable flt/rt rules starts
> + * @hash_rules_size: Size in bytes of the hashable tbl to cpy to local mem
> + * @hash_local_addr: Addr in shared mem where hashable flt/rt tbl should
> + *  be copied to
> + * @nhash_rules_size: Size in bytes of the non-hashable tbl to cpy to local mem
> + * @nhash_local_addr: Addr in shared mem where non-hashable flt/rt tbl should
> + *  be copied to
> + * @rsvd: reserved
> + * @nhash_rules_addr: Addr in sys mem where non-hashable flt/rt tbl starts
> + */
> +struct ipa_imm_cmd_hw_ip_fltrt_init {
> +       u64 hash_rules_addr;
> +       u64 hash_rules_size     : 12,
> +           hash_local_addr     : 16,
> +           nhash_rules_size    : 12,
> +           nhash_local_addr    : 16,
> +           rsvd                : 8;
> +       u64 nhash_rules_addr;
> +};

In hardware structures, you should not use bit fields, as the ordering
of the bits is not well-defined in C. The only portable way to do this
is to use shifts and masks unfortunately.

> +struct ipa_imm_cmd_hw_hdr_init_local {
> +       u64 hdr_table_addr;
> +       u32 size_hdr_table      : 12,
> +           hdr_addr            : 16,
> +           rsvd                : 4;
> +};

I would also add a 'u32 pad' member at the end to make the padding
explicit here, or mark the first member as '__aligned(4) __packed'
if you want to avoid the padding.

> +void *ipahal_dma_shared_mem_write_pyld(struct ipa_dma_mem *mem, u32 offset)
> +{
> +       struct ipa_imm_cmd_hw_dma_shared_mem *data;
> +
> +       ipa_assert(mem->size < 1 << 16);        /* size is 16 bits wide */
> +       ipa_assert(offset < 1 << 16);           /* local_addr is 16 bits wide */
> +
> +       data = kzalloc(sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return NULL;
> +
> +       data->size = mem->size;
> +       data->local_addr = offset;
> +       data->direction = 0;    /* 0 = write to IPA; 1 = read from IPA */
> +       data->skip_pipeline_clear = 0;
> +       data->pipeline_clear_options = IPAHAL_HPS_CLEAR;
> +       data->system_addr = mem->phys;
> +
> +       return data;
> +}

The 'void *' return looks odd here, and also the dynamic allocation.
It looks to me like all these functions could be better done the
other way round, basically putting the
ipa_imm_cmd_hw_dma_shared_mem etc structures on the stack
of the caller. At least for this one, the dynamic allocation
doesn't help at all because the caller is the same that
frees it again after the command. I suspect the same is
true for a lot of those commands.

       Arnd
