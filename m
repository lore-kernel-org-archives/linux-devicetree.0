From: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: USB support for device tree
Date: Sat, 05 Nov 2011 08:38:07 +0530
Message-ID: <4EB4A897.8020305@codeaurora.org>
References: <4EB3A165.8060300@codeaurora.org> <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com> <4EB424DD.4090609@codeaurora.org> <CACxGe6sYkCSnFvybGcjrkh4cNvtjS=t6fr456be4KFDc3Gre2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sYkCSnFvybGcjrkh4cNvtjS=t6fr456be4KFDc3Gre2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

On 11/4/2011 11:42 PM, Grant Likely wrote:
> It is not legal for two device nodes to have overlapping 'reg' regions
> (unless one is a child of the other), so by extension it is not okay
> for two nodes to have the same 'name@addr'.  However, it is perfectly
> acceptable and encouraged for two nodes at different addresses to
> start with the same value for 'name@'.  This is called the generic
> names recommended practice, and it can also be found in the ePAPR
> documentation on node names.
> 
> If you want to have both host and device drivers bound to a single
> device for OTG mode, then you should use a wrapper driver in Linux
> that binds to the single node and instantiates each of the interfaces
> as a child device.  For an example take a look at
> drivers/usb/host/fsl-mph-dr-of.c.

Currently we have two platform devices one for OTG and one for host,
corresponding drivers for them. If I would like to keep it this way, the
device tree becomes something like below

hsusb0-otg: usb-otg@0xa6000000 {
	compatible = "qcom,hsusb-otg";
        ---
};

hsusb0-device: usb-gadget@0xa6000000 {
	compatible = "qcom,hsusb-device";
        ---
};

hsusb0-host: usb@0xa6000000 {
	compatible = "qcom,hsusb-host", "usb-ehci";
        ---
};

Are you okay with above naming convention?

-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
