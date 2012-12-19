From: Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tlv320aic326x: Support for TI TLV320AIC3262
 audio driver
Date: Wed, 19 Dec 2012 16:50:44 +0100
Message-ID: <874nji3usr.fsf@dell.be.48ers.dk>
References: <1355233109-14489-1-git-send-email-mehar.bajwa@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355233109-14489-1-git-send-email-mehar.bajwa-l0cyMroinI0@public.gmane.org> (Mehar
 Bajwa's message of "Tue, 11 Dec 2012 19:08:29 +0530")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Moderator list <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rajeev Kumar <rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org>, Mukund <navada-l0cyMroinI0@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, amoderator list <lsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Hari <harik-l0cyMroinI0@public.gmane.org>, Mehar Bajwa <mehar.bajwa-l0cyMroinI0@public.gmane.org>, M R Swami Reddy <mr.swami.reddy-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Mehar" == Mehar Bajwa <mehar.bajwa-l0cyMroinI0@public.gmane.org> writes:

Hi,

 Mehar> TI TLV320AIC3262 is a flexible, low-power, low-voltage stereo
 Mehar> audio codec with digital microphone inputs and programmable
 Mehar> outputs. It includes powertune capabilities, enhanced
 Mehar> fully-programmable miniDSP, fixed predefined and parameterizable
 Mehar> signal processing blocks, integrated PLL and flexible digital
 Mehar> interfaces.

 Mehar> +	file = devm_kzalloc(codec->dev, PAGE_SIZE, GFP_KERNEL);
 Mehar> +	if (file == NULL)
 Mehar> +		return -ENOMEM;
 Mehar> +
 Mehar> +	snprintf(file, PAGE_SIZE, "%s_fw_v%d.bin", ps_state->dev_name,
 Mehar> +				ps_state->version);
 Mehar> +	file[PAGE_SIZE - 1] = '\0';
 Mehar> +
 Mehar> +	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
 Mehar> +				file, codec->dev,
 Mehar> +				GFP_KERNEL, codec, aic3262_firmware_load);

What is this firmware, where can it be found and what is it's license?

You seem to be leaking file here.

 Mehar> +	if (ret < 0) {
 Mehar> +		dev_err(codec->dev, "Firmware request failed\n");
 Mehar> +		goto firm_err;
 Mehar> +	}
 Mehar> +
 Mehar> +	return 0;
 Mehar> +firm_err:
 Mehar> +	if (irq_ret)
 Mehar> +		aic3xxx_free_irq(aic3xxx,
 Mehar> +				 AIC3XXX_IRQ_HEADSET_DETECT, codec);
 Mehar> +	destroy_workqueue(aic3262->workqueue);
 Mehar> +work_err:
 Mehar> +	kfree(aic3262->cfw_p);
 Mehar> +	return ret;
 Mehar> +}

-- 
Bye, Peter Korsgaard
