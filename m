From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 0/2] Add reboot modes for LEGO MINDSTORMS EV3
Date: Mon, 19 Feb 2018 12:03:35 -0600
Message-ID: <be3b9e55-a425-cf82-39e4-6ee625ece7fd@lechnology.com>
References: <1515724191-30499-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515724191-30499-1-git-send-email-david@lechnology.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/11/2018 08:29 PM, David Lechner wrote:
> This series adds a new device tree node to declare a special memory
> address that is used by the I2C bootloader on LEGO MINDSTORMS EV3
> to boot into a special firmware update mode and enables the required
> module to use it.
> 
> v2 changes:
> * rebase on linux-davinci/master
> 
> David Lechner (2):
>    ARM: dts: da850-lego-ev3: Add node for reboot modes
>    ARM: davinci_all_defconfig: enable SYSCON_REBOOT_MODE
> 
>   arch/arm/boot/dts/da850-lego-ev3.dts   | 17 +++++++++++++++++
>   arch/arm/configs/davinci_all_defconfig |  1 +
>   2 files changed, 18 insertions(+)
> 

Hi Sekhar,

Any objection to pickup up this series? It is independent of all
of the other changes I have been working on.
