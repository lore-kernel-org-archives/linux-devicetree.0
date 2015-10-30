From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 1/1] ARM: meson: Add status LED for Odroid-C1
Date: Fri, 30 Oct 2015 19:13:38 +0100
Message-ID: <CAOQ7t2axGQkcvQqa-XhFojxfSXpwp9xrME7==d7=pVH16-WG8w@mail.gmail.com>
References: <1444401430-4396-1-git-send-email-edward.cragg@codethink.co.uk>
 <1444401430-4396-2-git-send-email-edward.cragg@codethink.co.uk>
 <20151030175524.GD21307@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151030175524.GD21307@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Edward Cragg <edward.cragg@codethink.co.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 6:55 PM, Edward Cragg
<edward.cragg@codethink.co.uk> wrote:
> On Fri, Oct 09, 2015 at 03:37:10PM +0100, Edward Cragg wrote:
>> Add the blue status LED to the Hardkernel Odroid C1 board DTS.
>> This is the only programmable LED on the board.
>>
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> ---
>>  arch/arm/boot/dts/meson8b-odroidc1.dts | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>
> Hi, has anyone had a chance to have a look at this yet?

Yes, I already replied to you on Oct 12.
I was waiting for a resubmission without the added copyright but I'll
modify it myself and I'll push a PR.

Cheers,

-- 
Carlo Caione
