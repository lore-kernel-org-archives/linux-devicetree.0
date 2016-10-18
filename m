From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 08/19] thermal: sti: Remove obsolete platforms from the DT
 doc.
Date: Tue, 18 Oct 2016 09:56:01 +0200
Message-ID: <cf070457-4bd5-46e1-ff91-7dab047ade55@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-9-git-send-email-peter.griffin@linaro.org>
 <20160923150815.GD9176@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923150815.GD9176@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/23/2016 05:08 PM, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 02:27:46PM +0100, Peter Griffin wrote:
>> STiH415/6 SoC's are being removed from the kernel. This
>> patch removes the compatibles from the dt doc and also
>> updates the example to a supported platform.
>>
>> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Cc: <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/thermal/st-thermal.txt     | 28 +++++++---------------
>>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


Applied on sti-dt-for-4.10 branch

Thanks 

> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
