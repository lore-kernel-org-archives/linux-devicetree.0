From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: of: Add support for parsing regulator_state
 for suspend state
Date: Tue, 10 Jun 2014 19:25:46 +0900
Message-ID: <5396DD2A.7060701@samsung.com>
References: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
 <1402309780-8118-2-git-send-email-cw00.choi@samsung.com>
 <20140609192133.GD5099@sirena.org.uk> <53964A45.3010108@samsung.com>
 <20140610100232.GD5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140610100232.GD5099-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/2014 07:02 PM, Mark Brown wrote:
> On Tue, Jun 10, 2014 at 08:59:01AM +0900, Chanwoo Choi wrote:
>> On 06/10/2014 04:21 AM, Mark Brown wrote:
> 
>>> If we're going to do that we'd need to define what modes mean in the DT
>>> binding - currently there's no support for modes at all because it's
>>> complicated to come up with sensible and meaningful generic defintions.
> 
>> The 'regulator-mode' of this patch means following defined constant variable
>> as following in include/linux/regulator/consumer.h:
>> #define REGULATOR_MODE_FAST		0x1
>> #define REGULATOR_MODE_NORMAL		0x2
>> #define REGULATOR_MODE_IDLE		0x4
>> #define REGULATOR_MODE_STANDBY		0x8
> 
>> If regulator consumer would use this mode('regulator-mode),
>> specific regulator driver should implement rdev->desc->ops->set_suspend_mode function
>> to control regulator state according to 'regulator-mode' in suspend state.
> 
> Sure, but what do those mean?
> 

We could check basic explanation of regulator mode in include/linux/regulator/consumer.h.
Should I add detailed descritpion of REGULATOR_MODE_* constant in drivers/regulator/of_regulator.c?



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
