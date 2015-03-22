From: Rob Herring <robherring2@gmail.com>
Subject: Re: serial atag tag in devicetree ?
Date: Sun, 22 Mar 2015 16:01:35 -0500
Message-ID: <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
References: <550EA6D8.3090702@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <550EA6D8.3090702@redhat.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Ian Campbell <ijc@hellion.org.uk>, U-Boot <u-boot@lists.denx.de>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 22, 2015 at 6:26 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
>
> I'm sending this mail because Paul Kocialkowski (in the Cc)
> has submitted a patch for upstream u-boot to set the serial
> atag tag from u-boot for Allwinner SoCs, using the SoCs
> SID, which is a 128 bit register containing a unique number
> for each SoC.

We shouldn't really be adding ATAGs to newer platforms...

> In some cases a manufacturer may want to override this with
> its own serial from say an eeprom, as such it is desirable
> to communicate the serial from u-boot to the kernel rather
> then reproducing the sid reading code in the kernel.
>
> For old atag using kernels there is an atag for this, and
> the contents of this tag will show up in /proc/cpuinfo,
> currently there is no equivalent for this in devicetree.
>
> I'm a bit reluctant to merge Paul's patch into u-boot
> because of this as it will enable a feature on older
> kernels while leaving the upstream kernel without it.
>
> So I was wondering how to deal with this in devicetree,
> at least one board in u-boot already sets a devicetree
> property for this:
>
> board/gateworks/gw_ventana/gw_ventana.c
> 1202: *   serial# env var
> 1207:   char *serial = getenv("serial#");
> 1432:           setenv("serial#", str);
> 1512:   fdt_setprop(blob, 0, "system-serial", getenv("serial#"),
> 1513:               strlen(getenv("serial#")) + 1);
>
> Which sets a system-serial property in the root node,
> so at the same level where we also have the model string
> this seems to make sense to me.

system-serial is new to me...

> So do we want to add a devicetree binding for system
> serials, and if we do should we make it a string like
> above, or should we make it an 64 bit integer like the atag?
>
> If we make it a string we can store longer serials, but
> how should we deal with those wrt /proc/cpuinfo? Only show
> the first 64 bits ?

There is already "serial-number" (a string) which exists for
OpenFirmware. Also, "copyright" corresponds to vendor/manufacturer
string. Both of these are supported by lshw already.

Rob

>
> Regards,
>
> Hans
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> http://lists.denx.de/mailman/listinfo/u-boot
