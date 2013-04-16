From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: Query on pinctrl usage for DT nodes
Date: Tue, 16 Apr 2013 09:18:22 +0200
Message-ID: <516CFB3E.8040703@ti.com>
References: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w@mail.gmail.com>
 <515C5C76.3080009@wwwdotorg.org> <20130403183803.GA10155@atomide.com>
 <20130403184202.GB10155@atomide.com> <516BB818.3060603@ti.com>
 <516C2D74.2090106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <516C2D74.2090106@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tony Lindgren <tony@atomide.com>, device-tree <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/15/2013 06:40 PM, Stephen Warren wrote:
> So, the solution here is for pinctrl-single to create a separate
> pin/group object for each separately controllable entity, and that may
> be each bit in a register rather than each register, depending on HW.

Exactly what I was thinking.
It would be ideal if we could do this dynamically, so when a new
pinctr-single,bits is added we create a new object (after checking for
overlapping bits from previous objects).
If this is not possible we should have new property telling pinctrl-single =
how
many objects to create for one physical register (used only when
pinctrl-single,bit-per-mux is defined), something like:

pinctrl-single,bit-per-mux;
pinctrl-single,functions-per-register =3D <X>;

For sure we need to check here as well for overlaps in the bitfields...

-- =

P=E9ter
