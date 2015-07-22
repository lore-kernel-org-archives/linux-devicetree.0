From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/9]  Add STiH407 fanmily pinctrl DT for tsin, tsout and
 mtsin channels
Date: Wed, 22 Jul 2015 11:03:47 +0200
Message-ID: <55AF5C73.3010509@st.com>
References: <1433945046-19855-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433945046-19855-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 06/10/2015 04:03 PM, Peter Griffin wrote:
> Hi folks,
>
> This set adds in the necessary DT pinctrl configuration for the transport stream
> input channels, transport stream output channels and merged transport stream input
> channels for STiH407 family silicon.
>
> Some of these channels have alternate pinctrl configurations depending on the board
> design. These pinctrl groups will be used by the LinuxDVB c8sectpfe driver which
> will be upstreamed in due course, which allows LDVB tuners and demodulators to be
> used with an upstream kernel to get transport stream data into the SoC.
>
> regards,
>
> Peter.
>
> Peter Griffin (9):
>    ARM: STi: DT: Add STiH407 family tsin0 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsin1 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsin2 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsin3 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsin4 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsin5 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsout0 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family tsout1 pinctrl configuration
>    ARM: STi: DT: Add STiH407 family mtsin0 pinctrl configuration
>
>   arch/arm/boot/dts/stih407-pinctrl.dtsi | 200 +++++++++++++++++++++++++++++++++
>   1 file changed, 200 insertions(+)
>
Series applied for v4.3.

Thanks,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
