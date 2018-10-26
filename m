From: Liming Sun <lsun@mellanox.com>
Subject: RE: [PATCH v4 2/4] arm64: Add Mellanox BlueField SoC config option
Date: Fri, 26 Oct 2018 19:18:30 +0000
Message-ID: <AM4PR05MB32204021433BBB853C50FF30A1F00@AM4PR05MB3220.eurprd05.prod.outlook.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1540403734-137721-1-git-send-email-lsun@mellanox.com>
 <1540403734-137721-2-git-send-email-lsun@mellanox.com>
 <CAK8P3a1jTsvzYhS4CxvmK6tOgPn_g7=1S4xAcca2K4v70vhyEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a1jTsvzYhS4CxvmK6tOgPn_g7=1S4xAcca2K4v70vhyEA@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Woods <dwoods@mellanox.com>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Robin Murphy <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thanks Arnd for the comments!  Please see my response inline.

- Liming

> -----Original Message-----
> From: arndbergmann@gmail.com [mailto:arndbergmann@gmail.com] On
> Behalf Of Arnd Bergmann
> Sent: Thursday, October 25, 2018 11:38 AM
> To: Liming Sun <lsun@mellanox.com>
> Cc: Olof Johansson <olof@lixom.net>; David Woods
> <dwoods@mellanox.com>; Robin Murphy <robin.murphy@arm.com>; arm-
> soc <arm@kernel.org>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v4 2/4] arm64: Add Mellanox BlueField SoC config option
> 
> On 10/24/18, Liming Sun <lsun@mellanox.com> wrote:
> > This commit introduces config option for Mellanox BlueField SoC,
> > which can be used to build the SoC specific drivers, and enables
> > it by default in configs/defconfig.
> >
> > Reviewed-by: David Woods <dwoods@mellanox.com>
> > Signed-off-by: Liming Sun <lsun@mellanox.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 6 ++++++
> >  arch/arm64/configs/defconfig | 1 +
> >  2 files changed, 7 insertions(+)
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm sorry for missing your series in the past. We should definitely merge
> the platform support soon. Do you also have device tree files for reference
> systems or even production hardware?

We have obsoleted the device tree, and mainly support ACPI now
on Reference/Production HW. Below is the TMFIFO definition in the ACPI
DSDT table.

    // RShim TMFIFO
    Device(RSH0) {
      Name(_HID, "MLNXBF01")
      Name(_UID, Zero)
      Name(_CCA, 1)
      Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x00800a20, 0x00000018)
        Memory32Fixed(ReadWrite, 0x00800a40, 0x00000018)
        Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive)
          { BF1_RSH0_TM_HTT_LWM_INT,
            BF1_RSH0_TM_HTT_HWM_INT,
            BF1_RSH0_TM_TTH_LWM_INT,
            BF1_RSH0_TM_TTH_HWM_INT
          }
      })
    }

The full ACPI implementation can be found in the 1.0 release:
http://www.mellanox.com/downloads/BlueField/BlueField-1.0.0.10521/BlueField-1.0.0.10521.tar.xz
Inside this tarball, we can see the "src/edk2/" directory which has the edk2 patch file including all the ACPI implementation.

> 
> I need to have a separate look at the fifo driver.
> 
> Unfortunately, you have sent these patches during the merge window,
> which is the time during which we don't pick up new work. Let's plan
> to pick these up after 4.20-rc1, and please resend to arm@kernel.org
> if we manage to forget about it again.
> 
>       Arnd

Thanks for the information. I'll resend it to make sure not to miss the date.
