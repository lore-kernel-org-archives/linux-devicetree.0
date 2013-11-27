From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v2 00/10] Reuse davinci-nand driver for Keystone arch
Date: Wed, 27 Nov 2013 13:51:21 +0200
Message-ID: <5295DCB9.7030708@ti.com>
References: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
 <20131127013309.GT9468@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131127013309.GT9468@ld-irv-0074.broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/27/2013 03:33 AM, Brian Norris wrote:
> Hi Ivan,
>
> On Thu, Nov 21, 2013 at 01:28:15PM +0200, Ivan Khoronzhuk wrote:
>> This series contains fixes and updates of Davinci nand driver in
>> order to reuse it for Keystone platform.
>>
>> The series is combination of two following series:
>> - Davinci nand driver fixes and updates:
>>    https://lkml.org/lkml/2013/11/20/271
>> - Reuse davinci-nand driver for Keystone arch
>>    https://lkml.org/lkml/2013/11/20/315
>
> Can you make sure to consistently change the email $subject for your
> patch series? For each of the above, it looks like they are actually
> version 2, yet they still just say "[PATCH X/Y]" (not "[PATCH v2 X/Y]").
> This makes it harder to parse the history of each series. (And the
> combining of two un-versioned patch series adds to the confusion.)
>
> Now, this combined series has a good v2 marking (although at this point,
> is it really v3? ...whatever, it doesn't matter). Please continue to
> write appropriate $subjects for this and future patch series.
>
> Thanks,
> Brian
>

Sorry for the mess, I will

-- 
Regards,
Ivan Khoronzhuk
