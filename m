From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] enable HQVDP for stih410 platform
Date: Fri, 14 Aug 2015 10:34:36 +0200
Message-ID: <55CDA81C.6040307@st.com>
References: <1439305964-15641-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439305964-15641-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Benjamin,

     The title needs to be appended with "ARM: dts:".

     If you agree, I can fix this when applying it.


On 08/11/2015 05:12 PM, Benjamin Gaignard wrote:
> From: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
>
> Add HQVDP in stih410 devicetree to enable it.
> HQVDP bindings have been describe in
> Documentation/devicetree/bindings/gpu/st,stih4xx.txt file.
>
> Signed-off-by: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
You need also your sign-off here. I will add it too.
> ---
>   arch/arm/boot/dts/stih410.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
>

Regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
