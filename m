From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: Query on pinctrl usage for DT nodes
Date: Mon, 15 Apr 2013 10:26:07 +0200
Message-ID: <516BB99F.2080502@ti.com>
References: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w@mail.gmail.com>
 <515C5C76.3080009@wwwdotorg.org>
 <CA+V-a8t3wtP77DdeUoQHKMjAuWmV+ude+1J3UjJmMTqobgStjA@mail.gmail.com>
 <5162FD4A.1030909@wwwdotorg.org>
 <CA+V-a8vwdCkyMqiynj5BodXbjwJ=e4qNb-29FhLweqbjc7DBQA@mail.gmail.com>
 <5165A22B.4070200@wwwdotorg.org> <20130410203408.GP10155@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130410203408.GP10155@atomide.com>
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
Cc: Stephen Warren <swarren@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, linus.walleij@linaro.org, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/10/2013 10:34 PM, Tony Lindgren wrote:
> Yeah how about just change the pintctrl-single,bits register
> naming to be register + bit?  Something like 0xdeadbeef.0 and
> 0xdeadbeef.1 and so on.

Something like this might work I think. It is going to be a bit tricky IMHO
since we might need span out new 'register' every time a device requests fo=
r a
new pinctrl-single,bits for already used register in the
pinctrl-single,bit-per-mux area. In this way we still can make sure that
certain bit are only used by a single driver.

-- =

P=E9ter
