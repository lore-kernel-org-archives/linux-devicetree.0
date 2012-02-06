From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [RFC PATCH 1/7] ARM: davinci,
 intc: Add OF support for TI interrupt controller
Date: Mon, 06 Feb 2012 07:36:11 +0100
Message-ID: <4F2F74DB.7010604@denx.de>
References: <1327308967-8092-1-git-send-email-hs@denx.de>
 <1327308967-8092-2-git-send-email-hs@denx.de>
 <20120202045459.GI15343@ponder.secretlab.ca>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120202045459.GI15343-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant,

Grant Likely wrote:
> On Mon, Jan 23, 2012 at 09:56:01AM +0100, Heiko Schocher wrote:
>> Add a function to initialize the davinci interrupt controller (INTC)
>> using a device tree node.
>>
>> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
>> Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/davinci/intc.txt       |   26 ++++++++++
>>  arch/arm/mach-davinci/cp_intc.c                    |   51 ++++++++++++++++++++
>>  arch/arm/mach-davinci/include/mach/cp_intc.h       |    1 +
>>  3 files changed, 78 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/davinci/intc.txt
[...]
>> diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
>> index f83152d..2c6e2e4 100644
>> --- a/arch/arm/mach-davinci/cp_intc.c
>> +++ b/arch/arm/mach-davinci/cp_intc.c
[...]
>> +	cp_intc_init();
>> +	irq_domain_add_simple(node, 0);
> 
> Take a look at the irq_domain patches that will be (probably) merged
> in v3.4.  Instead of calling irq_domain_add_simple(), you should
> migrate the whole interrupt controller to natively use an irq_domain
> for hwirq <--> irq mapping.

I rebased my hole patchset to:

git://git.secretlab.ca/git/linux-2.6.git irqdomain/next
and reworked the arch/arm/mach-davinci/cp_intc.c irq driver to use
irq_domain, works good on the enbw_cmc board :-)

Waiting for your comment to my question to the
[RFC PATCH 7/7] ARM: davinci: add support for the am1808 based enbw_cmc board
patch, see:
http://www.mail-archive.com/linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg07132.html

and resend the hole reworked patchserie. Is it OK, if I use the above
branch as base for sending this patchserie, or should I use another
tree/branch for it?

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
