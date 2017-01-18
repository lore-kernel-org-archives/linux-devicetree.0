From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] clk: meson-gxbb: Export HDMI clocks
Date: Wed, 18 Jan 2017 10:12:41 -0800
Message-ID: <m2mveo1bl2.fsf@baylibre.com>
References: <1484654928-5640-1-git-send-email-narmstrong@baylibre.com>
 <20170117183441.GU17126@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117183441.GU17126@codeaurora.org> (Stephen Boyd's message
 of "Tue, 17 Jan 2017 10:34:41 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com, linux-kernel@vger.kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 01/17, Neil Armstrong wrote:
>> Export HDMI clock from internal to dt-bindings.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>
> I think we decided this would go with the dts changes if more
> needed to be exposed.

Ah, that's right.  I'll queue it up in the amlogic dt branch with your
ack.

Thanks,

Kevin
