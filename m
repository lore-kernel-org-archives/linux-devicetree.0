From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 8/8] ARM: dts: kirkwood-rd88f6281: Utilize new DSA
 binding
Date: Tue, 17 Jan 2017 09:45:40 -0800
Message-ID: <3255f84c-7d1c-0854-2373-08276ac6b271@gmail.com>
References: <20170105192957.14304-1-f.fainelli@gmail.com>
 <20170105192957.14304-9-f.fainelli@gmail.com> <20170117173404.GG9470@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117173404.GG9470@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 01/17/2017 09:34 AM, Andrew Lunn wrote:
> On Thu, Jan 05, 2017 at 11:29:57AM -0800, Florian Fainelli wrote:
>> Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
>> Document new binding"). The legacy binding node is kept included, but is marked
>> disabled.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  arch/arm/boot/dts/kirkwood-rd88f6281-z0.dts | 11 ++++++++
>>  arch/arm/boot/dts/kirkwood-rd88f6281.dtsi   | 44 +++++++++++++++++++++++++++++
>>  2 files changed, 55 insertions(+)
> 
> Hi Florian
> 
> What about arch/arm/boot/dts/kirkwood-rd88f6281-a.dts

Whoops, missed that one, let me resubmit a change to that file too along
with your tags on the other patches, thanks for testing and reviewing!
-- 
Florian
