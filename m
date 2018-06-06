From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: cygnus: Add HWRNG node
Date: Wed, 6 Jun 2018 09:47:12 -0700
Message-ID: <c7990001-00e6-d828-bafd-3d472fcfee20@gmail.com>
References: <20180606093441.16483-1-peron.clem@gmail.com>
 <c8836130-1d96-b813-4e87-5011db679ba8@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8836130-1d96-b813-4e87-5011db679ba8@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

On 06/06/2018 09:03 AM, Scott Branden wrote:
> Hi Clement,
> 
> 
> On 18-06-06 02:34 AM, Clément Péron wrote:
>> From: Clément Peron <clement.peron@devialet.com>
>>
>> There is a HWRNG in Broadcom Cygnus SoC, so enable it.
>>
>> Signed-off-by: Clément Peron <clement.peron@devialet.com>
> Thanks for upstreaming some missing Cygnus components.
> 
> But, the problem is the tarball release from Broadcom you are extracting
> these changes from does not contain git history; so, you are missing the
> original authors and signed-off's.
> I checked our internal git repository and for this commit the author is:
> Mohamed Ismail Abdul Packir Mohamed <mohamed-ismail.abdul@broadcom.com>
> 
> Please adjust author and signed-off appropriately.  If there are other
> changes you are extracting from the source tarballs you have please
> contact me so we can construct patch appropriately.

If you want the original author's Signed-off-by to be preserved, why
don't you extract it from your internal git tree and submit the patch on
Mohamed's behalf?

AFAICT what Clement is doing here is permissible given the Linux
developer certificate of origin though I am not a lawyer of course.
-- 
Florian
