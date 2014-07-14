From: Stefan Assmann <sassmann@kpanic.de>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi working
Date: Mon, 14 Jul 2014 14:05:19 +0200
Message-ID: <53C3C77F.7080208@kpanic.de>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140714120051.GF6800@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 14.07.2014 14:00, Mark Brown wrote:
> On Mon, Jul 14, 2014 at 01:50:55PM +0200, Stefan Assmann wrote:
>> This partly reverts the following commits to get the wifi working on
>> the Pandaboard OMAP4430 ES2.2.
>
>> 0e8e5c34cf1a8beaaf0a6a05c053592693bf8cb4 regulator: twl: Remove references to 32kHz clock from DT bindings
>> d1924519fe1dada0cfd9a228bf2ff1ea15840c84 regulator: twl: Remove TWL6030_FIXED_RESOURCE
>> 029dd3cefa46ecdd879f9b4e2df3bdf4371cc22c regulator: twl: Remove another unused variable warning
>> e76ab829cc2d8b6350a3f01fffb208df4d7d8c1b regulator: twl: Remove references to the twl4030 regulator
>
> No, you need to implement clocks using the clock API.  Please read the
> changelogs for the above commits...
>

Yes, that's what I expected. Got any pointers for me how to do this?
Never done that before, a little help would be appreciated.

   Stefan
