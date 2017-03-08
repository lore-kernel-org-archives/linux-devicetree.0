From: Stuart Yoder <Stuart.Yoder@arm.com>
Subject: Re: [PATCH v15 3/5] tee: add OP-TEE driver
Date: Wed, 8 Mar 2017 19:56:05 +0000
Message-ID: <4C0FFCAE-756B-4432-9791-290337A2F5AA@arm.com>
References: <1485605984-30064-1-git-send-email-jens.wiklander@linaro.org>
 <1485605984-30064-4-git-send-email-jens.wiklander@linaro.org>
 <CALRxmdDNdCXztby5Kf5BUsmw8zX5+0-g9M=hjAbpUxFvVRDfJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALRxmdDNdCXztby5Kf5BUsmw8zX5+0-g9M=hjAbpUxFvVRDfJw@mail.gmail.com>
Content-Language: en-US
Content-ID: <E347DBC008936840AD7F056BB4C3CF9C@eurprd08.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, Jens Wiklander <jens.wiklander@linaro.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nishanth Menon <nm@ti.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Will Deacon <Will.Deacon@arm.com>, Patrice CHOTARD <patrice.chotard@st.com>, Christophe PRIOUZEAU <christophe.priouzeau@st.com>, Franck ALBESA <franck.albesa@st.com>, "javier@javigon.com" <javier@javigon.com>, Loic PALLARDY <loic.pallardy@st.com>, Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "scott.branden@broadcom.com" <scott.branden@broadcom.com>, "jean-michel.delorme@st.com" <jean-michel.delorme@st.com>, "broonie@kernel.org" <broonie@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Etienne CARRIERE <etienne.carriere@st.com>, emmanuel.michel@st.co
List-Id: devicetree@vger.kernel.org

[cut]
> +static struct optee *optee_probe(struct device_node *np)
> +{
> +       optee_invoke_fn *invoke_fn;
> +       struct tee_shm_pool *pool;
> +       struct optee *optee = NULL;
> +       void *memremaped_shm = NULL;
> +       struct tee_device *teedev;
> +       u32 sec_caps;
> +       int rc;
> +
> +       invoke_fn = get_invoke_func(np);
> +       if (IS_ERR(invoke_fn))
> +               return (void *)invoke_fn;
> +
> +       if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
> +               pr_warn("api uid mismatch\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (!optee_msg_api_revision_is_compatible(invoke_fn)) {
> +               pr_warn("api revision mismatch\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
> +               pr_warn("capabilities mismatch\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       /*
> +        * We have no other option for shared memory, if secure world
> +        * doesn't have any reserved memory we can use we can't continue.
> +        */
> +       if (!(sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVERED_SHM))
> +               return ERR_PTR(-EINVAL);

Typo?  RESERVERED_SHM should be RESERVED_SHM

> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> +/*
> + * Exchanges capabilities between normal world and secure world
> + *
> + * Call register usage:
> + * a0  SMC Function ID, OPTEE_SMC_EXCHANGE_CAPABILITIES
> + * a1  bitfield of normal world capabilities OPTEE_SMC_NSEC_CAP_*
> + * a2-6        Not used
> + * a7  Hypervisor Client ID register
> + *
> + * Normal return register usage:
> + * a0  OPTEE_SMC_RETURN_OK
> + * a1  bitfield of secure world capabilities OPTEE_SMC_SEC_CAP_*
> + * a2-7        Preserved
> + *
> + * Error return register usage:
> + * a0  OPTEE_SMC_RETURN_ENOTAVAIL, can't use the capabilities from normal world
> + * a1  bitfield of secure world capabilities OPTEE_SMC_SEC_CAP_*
> + * a2-7 Preserved
> + */
> +/* Normal world works as a uniprocessor system */
> +#define OPTEE_SMC_NSEC_CAP_UNIPROCESSOR                BIT(0)
> +/* Secure world has reserved shared memory for normal world to use */
> +#define OPTEE_SMC_SEC_CAP_HAVE_RESERVERED_SHM  BIT(0)

Same typo?  s/RESERVERED_SHM/RESERVED_SHM/

Thanks,
Stuart


IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
