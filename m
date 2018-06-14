From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v1 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 14 Jun 2018 16:23:36 +0800
Message-ID: <CAA+hA=TjExQ7B3Px2HBHSejexBcXE_b93=8h8uihUkKDD9fpFw@mail.gmail.com>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-5-o.rempel@pengutronix.de>
 <CAA+hA=RpoRXUK+jB18F4OeYE9PG73SDa_NLYeN5Q2G3B1bC-JA@mail.gmail.com>
 <20180613124850.w3bzerkpkbql6ite@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180613124850.w3bzerkpkbql6ite@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Wed, Jun 13, 2018 at 8:48 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Wed, Jun 13, 2018 at 08:21:10PM +0800, Dong Aisheng wrote:
>> Hi Oleksij,
>>
>> On Fri, Jun 1, 2018 at 2:58 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>> > The Mailbox controller is able to send messages (up to 4 32 bit words)
>> > between the endpoints.
>>
>> Could we really be able to send up to 4 42bit words with this driver?
>>
>> It looks to me the current Mailbox framework is more designed for share mem
>> transfer which does not fit i.MX MU well.
>
> The mailbox framework just defines channels and messages. A message is a
> void * which may contain arbitrary data or even no data at all; some
> drivers simply ignore the message pointer, so in fact they act as a
> doorbell unit only.
>
> There's nothing about shared memory in the mailbox framework, but of
> course you can combine a mailbox driver and shared memory to a remote
> message mechanism. That could be done with the i.MX MU aswell and would
> indeed be a good match for the hardware.
>

Yes, you're right. My earlier reply is less accurate.
It seems the actual data type is interpreted by the underlying MU driver.

Regards
Dong Aisheng

> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
