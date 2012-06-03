From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] slimbus: Linux driver framework for SLIMbus.
Date: Sun, 03 Jun 2012 09:34:20 -0700
Message-ID: <1338741260.1881.14.camel@joe2Laptop>
References: <1338340310-4473-1-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1338340310-4473-1-git-send-email-sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, marc-vHKVnW1TcfG0ar3PoB3IswC/G2K4zDHf@public.gmane.org, gclemson-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joerg.roedel-5C7GfCeVMHo@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, trenn-l3A5Bk7waGM@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2012-05-29 at 19:11 -0600, Sagar Dharia wrote:
> SLIMbus (Serial Low Power Interchip Media Bus) is a specification
> developed by MIPI (Mobile Industry Processor Interface) alliance.

Just a few trivial notes before stopped reading as it was
very long.

> diff --git a/drivers/of/of_slimbus.c b/drivers/of/of_slimbus.c
[]
> +		name = kzalloc(SLIMBUS_NAME_SIZE, GFP_KERNEL);
> +		if (!name) {
> +			dev_err(&ctrl->dev, "of_slim: out of memory");

OOM messages aren't necessary as they are reported
with a dump_stack in the alloc functions and please
make sure all messages are newline terminated.

[]

> +		binfo = krealloc(binfo, (n + 1) * sizeof(struct slim_boardinfo),
> +					GFP_KERNEL);

Reallocs should _always_ use a new temporary.
Otherwise, there will be a memory leak of the
original pointer memory on failure.

> diff --git a/drivers/slimbus/slimbus.c b/drivers/slimbus/slimbus.c
[]
> +	if (ctrl->nchans) {
> +		ctrl->chans = kzalloc(ctrl->nchans * sizeof(struct slim_ich),
> +					GFP_KERNEL);

please use kcalloc where appropriate.

> +		ctrl->sched.chc1 =
> +			kzalloc(ctrl->nchans * sizeof(struct slim_ich *),
> +			GFP_KERNEL);
[]
> +		ctrl->sched.chc3 =
> +			kzalloc(ctrl->nchans * sizeof(struct slim_ich *),
> +			GFP_KERNEL);

kcalloc...

> +			ctrl->txnt = krealloc(ctrl->txnt,
> +					(i + 1) * sizeof(struct slim_msg_txn *),
> +					GFP_KERNEL);

that realloc ptr use again.

> +int slim_assign_laddr(struct slim_controller *ctrl, struct slim_eaddr *e_addr,
> +				u8 *laddr)
[]
> +			ctrl->addrt = krealloc(ctrl->addrt,
> +					(ctrl->num_dev + 1) *
> +					sizeof(struct slim_addrt),
> +					GFP_KERNEL);

and again, I won't look for it again.

> +static u16 slim_slicesize(u32 code)
> +{
> +	static const u8 sizetocode[16] = {0, 1, 2, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6,
> +						6, 6, 7};

Perhaps more style conformant as:

	static const u8 sizetocode[16] = {
		0, 1, 2, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7
	};

> +	if (code == 0)
> +		code = 1;
> +	if (code > ARRAY_SIZE(sizetocode))
> +		code = 16;

clamp()
