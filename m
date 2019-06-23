From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/2] extcon: Add fsa9480 extcon driver
Date: Mon, 24 Jun 2019 08:56:09 +0900
Message-ID: <871519f4-b653-e247-0afd-f7b1f29af8ae@samsung.com>
References: <CGME20190621111402epcas4p2f65fb1b6d3e83bd69bd129b27c90d295@epcas4p2.samsung.com>
        <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, myungjoo.ham@samsung.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19. 6. 21. 오후 8:13, Paweł Chmiel wrote:
> This small patchset adds support for Fairchild Semiconductor FSA9480
> microUSB switch.
> 
> It has been tested on Samsung Galaxy S and Samsung Fascinate 4G,
> but it can be found also on other Samsung Aries (s5pv210) based devices.
> 
> Tomasz Figa (2):
>   dt-bindings: extcon: Add support for fsa9480 switch
>   extcon: Add fsa9480 extcon driver
> 
> Changes from v1:
>   - Added newline at end of dt-bindings file
>   - Removed interrupt-parent from dt-bindings file
>   - Added Acked-by to dt-bindings patch
>   - Remove license sentences from driver
>   - Remove custom sysfs entries and manual switch code
>   - Switch to using regmap api
> 
>  .../bindings/extcon/extcon-fsa9480.txt        |  19 +
>  drivers/extcon/Kconfig                        |  12 +
>  drivers/extcon/Makefile                       |   1 +
>  drivers/extcon/extcon-fsa9480.c               | 395 ++++++++++++++++++
>  4 files changed, 427 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
>  create mode 100644 drivers/extcon/extcon-fsa9480.c
> 

Applied this series to extcon-next
after checked the build warning on extcon-testing branch.

Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
