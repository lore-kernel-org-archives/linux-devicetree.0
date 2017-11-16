From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [linux-sunxi] Cedrus driver
Date: Thu, 16 Nov 2017 08:11:29 -0500
Message-ID: <jwvd14imks9.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
        <1b12fa21-bfe6-9ba7-ae1d-8131ac6f4668@micronovasrl.com>
        <6fcdc0d9-d0f8-785a-bb00-b1b41c684e59@imkreisrum.de>
        <693e8786-af83-9d77-0fd4-50fa1f6a135f@micronovasrl.com>
        <20171116110204.poakahqjz4sj7pmu@flea>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> Where can I find a list of TODOs to get it ready to be merged?
> Assuming that the request API is in, we'd need to:
>   - Finish the MPEG4 support
>   - Work on more useful codecs (H264 comes to my mind)
>   - Implement the DRM planes support for the custom frame format
>   - Implement the DRM planes support for scaling
>   - Test it on more SoCs

Are all these really needed before it can be merged?


        Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
