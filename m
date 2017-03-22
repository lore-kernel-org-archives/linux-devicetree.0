From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 1/3] Input: max11801_ts: Add missing of_match_table
Date: Thu, 23 Mar 2017 00:05:17 +0530
Message-ID: <CAMty3ZApz+GVkeoT4-75tiJcn6-CxkzdOrMcH7hjK1k2Ht=ZUQ@mail.gmail.com>
References: <1490180808-2856-1-git-send-email-jagan@openedev.com> <20170322183039.GA2899@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20170322183039.GA2899@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jagan Teki <jagan@openedev.com>, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 12:00 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Mar 22, 2017 at 04:36:46PM +0530, Jagan Teki wrote:
>> From: Jagan Teki <jagan@amarulasolutions.com>
>>
>> Added missing of_match_table for max11801_ts driver with
>> compatible as "maxim,max11801_ts"
>>
>
> Why not "maxim,max11801"? Also, I think we'd need a binding document.

Compatibility purpose to make this is for touchscreen and few of other
*_ts.c files follow the same, and added binding documentation in 2/3
patch.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
