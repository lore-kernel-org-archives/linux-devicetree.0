From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] staging: dwc2: set up all module params
Date: Tue, 26 Nov 2013 12:42:52 -0700
Message-ID: <5294F9BC.4000502@wwwdotorg.org>
References: <1385442150-23561-1-git-send-email-swarren@wwwdotorg.org>
 <A2CA0424C0A6F04399FB9E1CD98E030458E2AD11@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E030458E2AD11@US01WEMBX2.internal.synopsys.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2013 12:27 PM, Paul Zimmerman wrote:
>> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
>> Sent: Monday, November 25, 2013 9:03 PM
>>
>> The DWC2 USB controller in the BCM2835 (Raspberry Pi) needs some non-
>> default parameters. Select these based on the compatible value from the
>> DT node. For all other HW, fall back to the default parameters currently
>> in use.
>>
>> The values in params_bcm2835[] were posted to the mailing list by Paul
>> quite some time ago. I made a couple of minor modifications since then;
>> to set ahbcfg instead of ahb_single, and to set uframe_sched.
> 
> Hi Stephen,
> 
> I don't see any code in this patch that is setting uframe_sched?

Hmm, that's true. What value should it be set to for the BCM2835, do you
know? I obviously have it set to 0, which seems to work out OK...
