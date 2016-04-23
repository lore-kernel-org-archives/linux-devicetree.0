From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/3] iio:imu:mpu6050: enhance mounting matrix support
Date: Sat, 23 Apr 2016 22:16:33 +0100
Message-ID: <34a1dcf9-ce32-17f7-30ed-4168c6be6c4f@kernel.org>
References: <cover.1461170293.git.gregor.boirie@parrot.com>
 <09429500c3879ba07731ce170d0a2242a0399422.1461170293.git.gregor.boirie@parrot.com>
 <20160422200508.GA28036@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422200508.GA28036@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Leonard Crestez <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/04/16 21:05, Rob Herring wrote:
> On Wed, Apr 20, 2016 at 07:23:45PM +0200, Gregor Boirie wrote:
>> Add a new rotation matrix sysfs attribute compliant with IIO core
>> mounting matrix API.
>> Matrix is retrieved from "in_anglvel_mount_matrix" and
>> "in_accel_mount_matrix" sysfs attributes. It is declared into mpu6050 DTS
>> entry as a "mount-matrix" property.
>>
>> Old interface is kept for backward userspace compatibility and may be
>> retrieved from legacy platform_data mechanism only.
>>
>> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>> ---
>>  Documentation/ABI/testing/sysfs-bus-iio            |  2 ++
>>  .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 13 ++++++++
>>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         | 36 ++++++++++++++++++++--
>>  drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |  4 ++-
>>  include/linux/platform_data/invensense_mpu6050.h   |  5 ++-
>>  5 files changed, 55 insertions(+), 5 deletions(-)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied, thanks,

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
