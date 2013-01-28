From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 2/6] ARM: davinci: da850: add DT node for I2C0
Date: Mon, 28 Jan 2013 05:17:28 +0000
Message-ID: <A4887BF146CD57468F700B415D2F4701581768@DBDE01.ent.ti.com>
References: <1359027324-14534-1-git-send-email-manishv.b@ti.com>
	<51026365.1020402@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <51026365.1020402-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "AnilKumar,
  Chimata" <anilkumar-l0cyMroinI0@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWMMKQXVYFwzLw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2013 at 16:20:13, Nori, Sekhar wrote:
> On 1/24/2013 5:05 PM, Vishwanathrao Badarkhe, Manish wrote:
> > Add I2C0 device tree node information to da850-evm.
> > Also, add I2C0 pin muxing information in da850-evm.
> > 
> > Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
> > ---
> > Depends on patch
> > http://comments.gmane.org/gmane.linux.davinci/25993
> > 
> >  arch/arm/boot/dts/da850-evm.dts |   15 +++++++++++++++
> >  arch/arm/boot/dts/da850.dtsi    |   10 ++++++++++
> >  2 files changed, 25 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/da850-evm.dts 
> > b/arch/arm/boot/dts/da850-evm.dts index 8cac9d2..3d8290a 100755
> > --- a/arch/arm/boot/dts/da850-evm.dts
> > +++ b/arch/arm/boot/dts/da850-evm.dts
> > @@ -27,5 +27,20 @@
> >  		serial2: serial@1d0d000 {
> >  			status = "okay";
> >  		};
> > +		i2c0@1c22000 {
> 
> This should be
> 		i2c0: i2c@1c22000
> 
> to follow the convention elsewhere in file.

Ok, I will change this in next version.

> 
> > +			status = "okay";
> > +		};
> > +	};
> > +};
> > +&pmx_core {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <
> > +		&i2c0_pins
> > +	>;
> > +
> > +	i2c0_pins: pinmux_i2c0_pins{
> > +		pinctrl-single,bits = <
> > +			0x10 0x00002200 0x0000ff00	/* I2C0_SDA,I2C0_SCL */
> > +		>;
> 
> This should go into the dtsi file. See the discussion on NAND DT support submitted by Anil Kumar.

I have seen Anil Kumar's discussion for pin-muxing which includes Linus patch of grab pin 
control handles from device core at following location:
http://lkml.indiana.edu/hypermail/linux/kernel/1301.2/00094.html

I have done changes accordingly for I2C0 pin muxing and seen kernel crashes giving message 
like "i2c_davinci i2c_davinci.1: could not find pctldev for node /soc/
pinmux@1c14120/pinmux_i2c0_pins, deferring probe". This is happened because I2C0 driver 
gets probed before pin mux driver.
  
To resolve this issue, I made changes in code to ensure pin control driver gets probed before 
I2C0 driver by registering pin control driver during arch_init call.
 
Hence, in order to move I2C0 pin muxing in dtsi file above fix is required.
> 
> Thanks,
> Sekhar
> 
> PS: You are using an old address for Kevin Hilman. The MAINTAINERS file has been updated for a long time now. Liam's address is also wrong but I don't have his updated e-mail.
> 


Regards, 
Manish
