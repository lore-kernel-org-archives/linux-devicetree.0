From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH linux v3 3/6] hwmon: occ: Add I2C transport
 implementation for SCOM operations
Date: Sun, 22 Jan 2017 07:53:17 +1100
Message-ID: <1485031997.2495.4.camel@kernel.crashing.org>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
         <1484601219-30196-4-git-send-email-eajames.ibm@gmail.com>
         <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b47e5359-5587-cc89-43e2-379eb9e95fc8-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, eajames.ibm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2017-01-21 at 10:11 -0800, Guenter Roeck wrote:
> > +int occ_i2c_getscom(void *bus, u32 address, u64 *data)
> > +{
> > +     ssize_t rc;
> > +     u64 buf;
> > +     struct i2c_client *client = bus;
> > +
> > +     rc = i2c_master_send(client, (const char *)&address,
> > sizeof(u32));
> > +     if (rc < 0)
> > +             return rc;
> > +     else if (rc != sizeof(u32))
> > +             return -EIO;
> > +
> > +     rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
> > +     if (rc < 0)
> > +             return rc;
> > +     else if (rc != sizeof(u64))
> > +             return -EIO;
> > +
> > +     *data = be64_to_cpu(buf);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(occ_i2c_getscom);

Additionally, this assumes that is is the only other user of that i2c
path to P8. Something interleaving will break it. pdbg for example.

Talk to Alistair, the right thing here would probably be to have
a separate driver that provides the XSCOM interface via i2c to both
in-kernel and userspace, with proper arbitration.

An expedient might be to instead have the address and data cycles
of the above be 2 i2c messages in one i2c request, thus being
serialized somewhat atomically with other transactions to that i2c
bus.

You may need to make sure the underlying i2c controller driver supports
dual messages, and if it doesn't fix it. This is rather classic 4-bytes 
subaddress style i2c, it shouldn't be too hard.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
