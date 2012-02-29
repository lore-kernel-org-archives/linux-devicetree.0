From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: davinci, intc: Add OF support for TI interrupt
	controller
Date: Wed, 29 Feb 2012 14:22:27 +0400
Message-ID: <4F4DFC63.9060509@mvista.com>
References: <1329893410-24413-1-git-send-email-hs@denx.de>
	<1329893410-24413-2-git-send-email-hs@denx.de>
	<4F44DE24.30606@mvista.com> <4F4DC8EB.7010201@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <4F4DC8EB.7010201-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: hs-ynQEQJNshbs@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 29-02-2012 10:42, Heiko Schocher wrote:

>>> Add a function to initialize the davinci interrupt controller (INTC)
>>> using a device tree node.

>>     cp_intc is not DaVinci interrupt controller, it's only used in
>> OMAP-L1x SoCs. cp_intc stands for Common Platform Interrupt Controller.

> Ah, Ok! Thanks for the explanation.

>> I don't see where you are initializiing the DaVinci interrupt controller
>> itself. You should understand that there are two disctinct types of
>> interrupt controllers used in the SoCs supported by arch/arm/mach-davinci/.

> board code:

> MACHINE_START(ENBW_CMC, "EnBW CMC")
> [...]
>          .init_irq       = davinci_init_irq,

> and in arch/arm/mach-davinci/cp_intc.c

> for the of case:

> void __init davinci_init_irq(void)
> {
>          of_irq_init(irq_match);
> }

> in drivers/of/irq.c:

> /**
>   * of_irq_init - Scan and init matching interrupt controllers in DT
>   * @matches: 0 terminated array of nodes to match and init function to call
>   *
>   * This function scans the device tree for matching interrupt controller nodes,
>   * and calls their initialization functions in order with parents first.
>   */
> void __init of_irq_init(const struct of_device_id *matches)

> Ok, the name of davinci_init_irq() is missleading ...

> Should I name it "cp_intc_of_init" ?

    Probably. At least something with "cp_intc" in the name...

> bye,
> Heiko

WBR, Sergei
