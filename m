From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/powernv: hwmon driver for power, fan rpm,
 voltage and temperature
Date: Tue, 08 Jul 2014 06:34:43 -0700
Message-ID: <53BBF373.6020703@roeck-us.net>
References: <20140708090315.3866.15604.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140708090315.3866.15604.stgit-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, svaidy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, sbhat-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/08/2014 02:08 AM, Neelesh Gupta wrote:
> This patch adds basic kernel support for reading power values, fan
> speed rpm, voltage and temperature data on powernv platforms which
> will be exported to user space through sysfs interface.
>
> Test results:
> -------------
> [root@tul163p1 ~]# sensors
> ibmpowernv-isa-0000
> Adapter: ISA adapter
> fan1:        5465 RPM  (min =3D    0 RPM)
> fan2:        5152 RPM  (min =3D    0 RPM)
> fan3:        5521 RPM  (min =3D    0 RPM)
> fan4:        4891 RPM  (min =3D    0 RPM)
> fan5:           0 RPM  (min =3D    0 RPM)
> fan6:           0 RPM  (min =3D    0 RPM)
> fan7:        7480 RPM  (min =3D    0 RPM)
> fan8:        7944 RPM  (min =3D    0 RPM)
> temp1:        +39.0=C2=B0C  (high =3D  +0.0=C2=B0C)
> power1:      190.00 W
>
> [root@tul163p1 ~]# ls /sys/devices/platform/
> alarmtimer  ibmpowernv.0  power  rtc-generic  serial8250  uevent
> [root@tul163p1 ~]# ls /sys/devices/platform/ibmpowernv.0/hwmon/hwmon0=
/
> device	    fan2_min	fan4_min    fan6_min	fan8_min   power
> fan1_fault  fan3_fault	fan5_fault  fan7_fault	in1_fault  power1_input
> fan1_input  fan3_input	fan5_input  fan7_input	in2_fault  subsystem
> fan1_min    fan3_min	fan5_min    fan7_min	in3_fault  temp1_input
> fan2_fault  fan4_fault	fan6_fault  fan8_fault	in4_fault  temp1_max
> fan2_input  fan4_input	fan6_input  fan8_input	name	   uevent
> [root@tul163p1 ~]# ls /sys/class/hwmon/hwmon0/
> device	    fan2_min	fan4_min    fan6_min	fan8_min   power
> fan1_fault  fan3_fault	fan5_fault  fan7_fault	in1_fault  power1_input
> fan1_input  fan3_input	fan5_input  fan7_input	in2_fault  subsystem
> fan1_min    fan3_min	fan5_min    fan7_min	in3_fault  temp1_input
> fan2_fault  fan4_fault	fan6_fault  fan8_fault	in4_fault  temp1_max
> fan2_input  fan4_input	fan6_input  fan8_input	name	   uevent
> [root@tul163p1 ~]#
>
> Signed-off-by: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Applied to -next, with a minor cleanup.

Thanks for your patience,

Guenter


> diff --git a/Documentation/hwmon/ibmpowernv b/Documentation/hwmon/ibm=
powernv
> new file mode 100644
> index 0000000..644245a
> --- /dev/null
> +++ b/Documentation/hwmon/ibmpowernv
> @@ -0,0 +1,41 @@
> +Kernel Driver IBMPOWENV

s/IBMPOWENV/IBMPOWERNV/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
