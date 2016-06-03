From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] of: add common OF-based component functionality
Date: Fri, 3 Jun 2016 14:52:28 -0500
Message-ID: <CAL_Jsq+=iUtXXHQRe3kM-zMJUo4iTODEiSMmp7nXHaG2QdxL_Q@mail.gmail.com>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyR-0005OJ-V3@rmk-PC.armlinux.org.uk>
 <CAL_JsqKaRGk6RMdDWUFYH8_J1gp3pcNeuvx-r=JSg7nc6jh_eg@mail.gmail.com>
 <20160603153630.GE1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160603153630.GE1041@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-mediatek@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 3, 2016 at 10:36 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Fri, Jun 03, 2016 at 10:29:40AM -0500, Rob Herring wrote:
>> On Fri, Jun 3, 2016 at 9:21 AM, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>> > Add common OF-based component functionality for matching devices by
>> > device node, and releasing the device node at the appropraite time.
>> >
>> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>> > ---
>> >  drivers/of/Makefile          |  2 +-
>> >  drivers/of/of_component.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>> >  include/linux/of_component.h | 14 ++++++++++++++
>>
>> I'd prefer this to go into drivers/base/component.c. That's the
>> general direction we've been moving.
>
> I'd prefer not to, I don't want to turn the component helpers into
> something OF specific.  They aren't OF specific.

Fine, not enough code to argue about...

>> I'd expect this would cause some build failures unless the cases you
>> converted all depend on CONFIG_OF.
>
> Okay, I'll stick with v1 then, and the duplication that v1 involves.

Why? You don't want to add empty functions? Seems like good clean-up.

Rob
