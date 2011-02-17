From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH OF 12/14] x86/rtc: don't register rtc if we
	the DT blob
Date: Thu, 17 Feb 2011 14:13:40 +0100
Message-ID: <20110217131340.GA13500@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-13-git-send-email-bigeasy@linutronix.de>
	<20110216220921.GI22837@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110216220921.GI22837-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-02-16 15:09:21 [-0700]:

>> @@ -236,6 +237,8 @@ static __init int add_rtc_cmos(void)
>>  		}
>>  	}
>>  #endif
>> +	if (of_have_populated_dt())
>> +		return 0;
>
>Hmmm, should this hunk be moved to the next patch to preserve bisectability?

Makes sense. Without this chunk it is simply adding
of_have_populated_dt(). So I merge with the next patch.

>g.

Sebastian
