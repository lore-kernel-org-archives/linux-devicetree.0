From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/3] iio:imu:mpu6050: enhance mounting matrix
 support
Date: Sat, 16 Apr 2016 11:18:54 +0100
Message-ID: <5712118E.30103@kernel.org>
References: <cover.1460113510.git.gregor.boirie@parrot.com>
 <594bc2f45d1894c9c3308509062b991e4a5fcc7e.1460113510.git.gregor.boirie@parrot.com>
 <20160411191212.GA30801@rob-hp-laptop>
 <20160411214428.GB1997@geburah.sephiroth>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160411214428.GB1997-PssPG7//kpQxWALZn0w5Ne1GAupnlqi7@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/04/16 22:44, Gregor Boirie wrote:
> On Mon, Apr 11, 2016 at 02:12:12PM -0500, Rob Herring wrote:
>> On Fri, Apr 08, 2016 at 04:12:05PM +0200, Gregor Boirie wrote:
>>> Add a new rotation matrix sysfs attribute compliant with IIO core
>>> mounting matrix API.
>>> Matrix is retrieved from "in_anglvel_mount_matrix" and
>>> "in_accel_mount_matrix" sysfs attributes. It is declared into mpu6050 DTS
>>> entry as a "mount-matrix" property.
>>
>> We have a common DT property, but can't have common sysfs interface?
> Agreed. Original driver was structured that way. In fact, a single matrix is
> enought for this sensor: AFAIK, reference frames are the same for gyro and
> accelero.
> I suppose that having a DTS and sysfs attribute per type of sample /
> "sub-device" ensure better userspace API consistency across drivers.
> Jonathan ?
If shared by all channels in device, could just be mount_matrix
(as per normal info_mask_shared_by_all elements on which we drop all reference
to the channel name).

However, we do have to allow for the per channel type version (and at least in theory
the per channel entry)  There are are weird devices combining multiple parallel accelerometers
in a package.  Possible for some reason that these could be other than parallel in some future
device.
So we end up with a sort of pyramid with any of the following being possible (and needing
a sysfs entry if they occur)  Taking a few examples...

mount_matrix
in_mount_matrix
out_mount_matrix
in_accel_mount_matrix
in_magn_mount_matrix
in_accel_x_mount_matrix
in_accel_y_mount_matrix
in_accel_x1_mount_matrix
in_accel_x2_mount_matrix 
etc where convention is to use the element highest up that covers the device in question.

It gets awkward if you have say an additional general purpose ADC channel on the device
as then clearly the mount matrix has nothing to do with it, but convention says we still
have to drop down to say in_accel_mount_matrix rather than using the mount_matrix form
that implies that it applies to the in_voltage0 channel.  Common sense and ABIs never
combine that well ;)

> 
>>
>> BTW, sysfs interfaces also have to be documented.
> Ok
Yes - update Documentation/sysfs/testing/sysfs-bus-iio with an appropriate entry please.
Btw - the above pyramid structure is why that document is huge (and often missing
entries that we all assumed were there for particular combinations of the above!)
> 
>>
>>>
>>> Old interface is kept for backward userspace compatibility and may be
>>> retrieved from legacy platform_data mechanism only.
>>>
>>> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 13 +++++
>>>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         | 56 ++++++++++++++++++++--
>>>  drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |  4 +-
>>>  include/linux/platform_data/invensense_mpu6050.h   |  5 +-
>>>  4 files changed, 72 insertions(+), 6 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
