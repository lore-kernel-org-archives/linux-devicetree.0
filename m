From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 3/3] DT: proc: Add runtime overlay interface in /proc
Date: Fri, 8 Nov 2013 09:12:52 +0200
Message-ID: <8386A27D-DBD6-4294-9265-1C3613784BFF@antoniou-consulting.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <1383676898-29819-4-git-send-email-panto@antoniou-consulting.com> <CANk1AXSHDDh1HrD_iBLNxopCrDqcDmoQs93i17UvGFtYR5_mEQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXSHDDh1HrD_iBLNxopCrDqcDmoQs93i17UvGFtYR5_mEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: delicious quinoa <delicious.quinoa@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Nov 8, 2013, at 1:38 AM, delicious quinoa wrote:

> On Tue, Nov 5, 2013 at 12:41 PM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:
>> +
>> +       pr_info("%s: Applied #%d overlay segments @%d\n", __func__,
>> +                       od->ovinfo_cnt, od->id);
>> +
> 
> This could be pr_debug so that we get normally get silence unless
> something fails, like insmod.
> 
> Also please take out the '#'.
> 

OK, will do on the next series.

> We see it working with our fpga ip driver and it looks really great.
> 

Glad to hear that.

> Alan

Regards

-- Pantelis
