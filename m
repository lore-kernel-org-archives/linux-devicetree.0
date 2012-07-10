From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: davinci: cp_intc: Add OF support for TI interrupt
 controller
Date: Tue, 10 Jul 2012 14:13:17 +0530
Message-ID: <4FFBEB25.6040501@ti.com>
References: <1341342970-27535-1-git-send-email-nsekhar@ti.com>
 <4FF58BDC.6060802@denx.de> <4FF71822.2070908@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF71822.2070908-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 7/6/2012 10:23 PM, Sekhar Nori wrote:
> Hi Grant,
> 
> On 7/5/2012 6:13 PM, Heiko Schocher wrote:
>> Hello Sekhar,
>>
>> On 03.07.2012 21:16, Sekhar Nori wrote:
>>> From: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
>>>
>>> Add a function to initialize the Common Platform Interrupt Controller
>>> (cp_intc) from TI used on OMAP-L1x SoCs using a device tree node.
>>>
>>> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
>>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
>>> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>
>>> Cc: Sergei Shtylyov<sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/arm/davinci/cp-intc.txt    |   27
>>> ++++++++++++++++++++
>>>   arch/arm/mach-davinci/cp_intc.c                    |   16 +++++++++---
>>>   arch/arm/mach-davinci/include/mach/cp_intc.h       |    1 +
>>>   3 files changed, 41 insertions(+), 3 deletions(-)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/arm/davinci/cp-intc.txt
>>
>> Thanks!
>>
>> Tested on the enbw_cmc board.
> 
> Any further feedback on this? If you are OK, I would like to queue this
> for v3.6 through DaVinci tree.

Do you have any feedback on this patch? Looks like Grant is going to be
busy for a while. If you do not have the original patch I can forward it
to you.

Thanks,
Sekhar
