From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3][ 3/9] usb: chipidea: Use standard usb-phy property.
Date: Fri, 14 Mar 2014 15:21:59 +0400
Message-ID: <5322E657.8030905@cogentembedded.com>
References: <1394618518-13803-1-git-send-email-denis@eukrea.com> <1394618518-13803-3-git-send-email-denis@eukrea.com> <edb50dd0d88541c39fc4b5def88b7f58@BL2PR03MB226.namprd03.prod.outlook.com> <5321CF4B.9000308@cogentembedded.com> <171967ece1414f9ba0e80664777892cb@BL2PR03MB226.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <171967ece1414f9ba0e80664777892cb-AZ66ij2kwaYFgBIGFwYtMOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 14-03-2014 5:57, Peter Chen wrote:

>>> According to Power_ePAPR_APPROVED_v1.1.pdf "ethernet-phy" is the node
>>> name, it is the same with Sergei's suggestion.

>>      Nobody's talking about "ehternet-phy" here.

> Hmm, you take "ethernet-phy" as an example, and suggest changing to "usb-phy" at last email.

    Then it's a wrong mail. I'm not mixing nodes and properties.

>>> But you have changed the property name at this patch, in fact,
>> "fsl,usbphy"
>>> is ok for property name, "fsl,usb-phy" may be better, but not worth a
>>> patch to change it.

>>      No, it's not better and both are not OK because they're still
>> Freescale specific while the de-facto standard property "usb-phy" is
>> already used by other USB drivers for the same purpose.

> Am I missing something, property name should be the same for all platforms?

    If they're doing the same standard thing, yes.

> Peter

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
