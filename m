From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v2 0/6] ARM: STi reset controller support
Date: Mon, 24 Feb 2014 14:03:54 +0000
Message-ID: <530B514A.4070209@st.com>
References: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>			<1391437665-11913-1-git-send-email-srinivas.kandagatla@st.com>		<1391592486.11239.4.camel@pizza.hi.pengutronix.de>	
 <52F4D76F.8070301@st.com> <5304B849.2080806@st.com>
 <1393237988.3091.14.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393237988.3091.14.camel@pizza.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin <maxime.coquelin@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stephen.gallimore@st.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thanks Philipp for your comments,

On 24/02/14 10:33, Philipp Zabel wrote:
>> > Did Srini's explanations convinced you?
>> > 
>> > If so, could you queue the series for v3.15?
> to be honest, I'm not comfortable with this explanation. If the
> "powerdown" bits only gate the clocks to those modules, calling it a
> reset control is clearly the wrong abstraction. If that is the case,
> couldn't you handle those bits via the clock framework?
I just had a re-look at the IPs specs for more information on where
these power-down signals are actually terminating on the IP side.

For example: ST-Synopsis Ethernet GMAC IP has two pins
power_down_req[IN] and power_down_ack[OUT]. power_down_req is used by
the software to either put the IP in powerdown or bring it out of
powerdown state.

The IP itself drives power_down_ack to indicate when the power down
request is successfully finished. For power_down/power_up request the IP
will change the internal state accordingly including powering up/down
its internal blocks and/or clock gating.

> If on the other hand these powerdown bits also trigger reset machinery,
> such that asserting and deasserting that bit will change the module's
> internal state, I could be convinced to queue them like this.
This is true with ST IPs, these lines change the state of the IP as
described above. Reset framework seems to fits in very well with this
behavior rather than power-domains or clock framework.

Thanks,
srini
