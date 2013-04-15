From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: Query on pinctrl usage for DT nodes
Date: Mon, 15 Apr 2013 10:19:36 +0200
Message-ID: <516BB818.3060603@ti.com>
References: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w@mail.gmail.com>
 <515C5C76.3080009@wwwdotorg.org> <20130403183803.GA10155@atomide.com>
 <20130403184202.GB10155@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130403184202.GB10155@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: device-tree <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, LAK <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/03/2013 08:42 PM, Tony Lindgren wrote:
> Oh it's already using pinctrl-single,bits option. Maybe there's a
> bug, adding Peter to cc.

I think all boils down to the fact that in pinctrl (single only?) _one_
register can be only associated with _one_ driver. Even through ,bit type
would allow us to only change parts of the same register, another device can
not take the same register with different mask.
I did noticed this after I have sent the bits-per-mux support.
Right now I don't have solution for this...

-- =

P=E9ter
