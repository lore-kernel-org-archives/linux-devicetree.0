From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/5] iio:magnetometer:ak8975: mounting matrix support
Date: Mon, 14 Mar 2016 18:18:17 +0100
Message-ID: <56E6F259.5020007@parrot.com>
References: <cover.1457001111.git.gregor.boirie@parrot.com> <022da3dfc0853c6f9820b24c2d9eaaf0c5ccf294.1457001111.git.gregor.boirie@parrot.com> <56DAFCEB.6080905@kernel.org> <56E0014D.1040209@parrot.com> <56E08B91.6070603@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E08B91.6070603-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/09/2016 09:46 PM, Jonathan Cameron wrote:

[snip...]
> Definitely needs ABI docs in Documentation/ABI/testing/sysfs-bus-iio
> as well. We need the reference directions to be well specified as
> well - how do we define the main hardware orientation?  on yours presumably
> the usual approach of using the screen is irrelevant so that definition
> could be a little 'interesting' to write down?
>> The standard orientation for us is defined with respect to the drone's head
>> and the propellers plane, which does not suit the nominal use cases indeed...
>> Although it really deserves some more detailed documentation, I wonder if the
>> question is relevant.
>> Given that the DTS is board specific (correct me if I'm wrong), why not
>> consider the reference orientation as board specific as well (and make the
>> whole thing implicit) ?
> I think that is fine for your sort of usecase - though might be nice to keep
> a bit of documentation somewhere (perhaps as comments in the DTS), or perhaps
> more centrally - would be nice for userspace libraries if at least all aircraft
> had a similar 'default orientation'.
As you said earlier, things are never that simple. The standard orientation
may vary with types of UAVs (quad-rotor, fixed wings, bizarre home made 
UFOs...)
> For the more 'standard' device with a screen I think we would want to standardise
> if at all possible.  Most hand held devices have a 'natural' orientation
> (front facing camera at the top for example).  In those cases we are basically looking
> at whether the sensor is mounted on the back or the front of the main circuit board and
> then of course it can be at any rotation in plane but typically is at 90 degrees
> (hence the inv mpu limitations)
>
> I'm guessing there are existing userspace mappings for this.  Perhaps in the Gnome
> sensors stuff?
[snip...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
