From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/6] ARM: dts: sun8i: add a cpu0 label to cpu@0 node on
 A23/33
Date: Wed, 14 Dec 2016 00:31:38 +0800
Message-ID: <CAGb2v65=Sh-WMEVk0Db48sgUcV6d7-wF_Yh0yJAHANMkGUzFwQ@mail.gmail.com>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-4-icenowy@aosc.xyz>
 <139af71f-390a-4023-8f82-71dd80212518@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <139af71f-390a-4023-8f82-71dd80212518@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Quentin Schulz <quentin.schulz@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 12:09 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 13/12/16 15:22, Icenowy Zheng wrote:
>> A "cpu0" label is needed on cpu@0 for cpufreq-dt to work.
>>
>
> IIUC any label should be fine and I don't see anything in the driver
> looking for such label name. All I see is it looks for cpu0 regulator
> for *legacy* DTs
>
>> Add such a label, in order to prepare for cpufreq support of A23/33.
>>
>
> You need this as you add the same label in the following patches. The
> commit message sounds like cpufreq-dt search for that label by name.

I think a more proper explanation would be:

The cpu's supply regulator is specified at the board level, hence we
need to add a label to it to reference it without replicating the whole
tree structure.

ChenYu
