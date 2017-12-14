From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [v2,
 1/2] dt: bindings: add new dt entry for ath10k calibration variant
Date: Thu, 14 Dec 2017 16:28:24 +0100
Message-ID: <c17f0a577bcd41569831c4eb556d376e@euamsexm01a.eu.qualcomm.com>
References: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208103742.3181-2-sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org> wrote:

> The bus + bmi-chip-id + bmi-board-id is not enough to identify the correct
> board data file on QCA4019 based devices. Multiple different boards share
> the same values. Only the original reference designs can currently be
> identified and loaded from the board-2.bin. But these will not result in
> the correct calibration data when combined with the pre-calibration data
> from the device.
> 
> An additional "variant" information has to be provided (via SMBIOS or DT)
> to select the correct board data for a design which was modified by an ODM.
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>

2 patches applied to ath-next branch of ath.git, thanks.

40fb0eab30ba dt: bindings: add new dt entry for ath10k calibration variant
d06f26c5c8a4 ath10k: search DT for qcom,ath10k-calibration-variant

-- 
https://patchwork.kernel.org/patch/10102249/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
