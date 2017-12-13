From: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/1] dt-bindings: arm: document supported STM32 SoC family
Date: Wed, 13 Dec 2017 09:40:50 +0100
Message-ID: <16700917-a53a-c319-d27d-f447c6ed3dce@st.com>
References: <1512741394-27341-1-git-send-email-ludovic.Barre@st.com>
 <20171212210348.proilmqmxf4yl5jn@rob-hp-laptop>
 <20171212231744.u4wtadrpaq3wp4sq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212231744.u4wtadrpaq3wp4sq@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gwenael Treuveur <gwenael.treuveur-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi Rob

Today there was no bindings documentation for STM32 SoC
already upstreamed. This patch adds initial list of STM32
existing in kernel.
The next serie adds just new soc and one compatible on STM32 list.
So, I think you could apply this patch.

BR
Ludo

On 12/13/2017 12:17 AM, Rob Herring wrote:
> On Tue, Dec 12, 2017 at 03:03:48PM -0600, Rob Herring wrote:
>> On Fri, Dec 08, 2017 at 02:56:34PM +0100, Ludovic Barre wrote:
>>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>>
>>> This adds a list of supported STM32 SoC bindings.
>>>
>>> Signed-off-by: Gwenael Treuveur <gwenael.treuveur-qxv4g6HH51o@public.gmane.org>
>>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/arm/stm32.txt | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/stm32.txt
>>
>> Applied, thanks.
> 
> Now dropped as this will conflict with your other series. Send this with
> the other series or indicate who should apply.
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Rob
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
