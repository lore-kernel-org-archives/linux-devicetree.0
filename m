From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] misc: Add initial Digital Timing Engine (DTE) driver
 for cygnus
Date: Tue, 12 May 2015 18:03:40 -0700
Message-ID: <5552A2EC.2060804@broadcom.com>
References: <1429744923-2007-1-git-send-email-jonathar@broadcom.com> <5543CD73.2030902@broadcom.com> <20150501203004.3add2c95@lxorguk.ukuu.org.uk> <9193036.7UYD2OGJHk@wuerfel> <554D1649.2030106@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <554D1649.2030106-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Darren Edamura <dedamura-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A bit more info is required here.

> Get timestamp: This is a bit more complicated. Currently the PTP driver
> does list management for timestamps from external timestamp channels.
> Timestamps from all channels go into the same list. In our driver we
> have a s/w FIFO for each client and it closely matches the h/w FIFO and
> handles any overflow. We would like to keep it this way because it also
> allows multiple user space processes to only fetch timestamps for the
> client it's handling. We could add a new ioctl to get a timestamp from
> the driver instead of doing it through ptp_read() but it would be nice
> if we could let ptp_read() allow the driver to do timestamp management
> instead of PTP. Maybe provide an option to obtain the timestamps from a
> container in the driver instead of the one managed by PTP. I like being
> able to use read/poll to obtain data instead of polling the kernel with
> ioctls as we are currently doing. Also, avoiding the kmalloc in ptp_read
> would be nice because this of the frequency it would be called at. Do
> you have any preference on how to handle this?
> 
> I've tried to minimize the changes to PTP.

Using read() we can't specify a channel to get the timestamp for. It
would imply that one user space process would have to read timestamps
for all channels/clients and then leave it up to user space IPC to get
them to other processes, which isn't great. That means either we
introduce an ioctl such as the DTE_GET_TIMESTAMP we had before which
allows us to specify a channel, or we need to look at creating one dev
node per external timestamping channel.

The ioctl limitation is that it pounds the kernel polling for timestamps
and the multiple dev nodes per channel is a big change to PTP. I will
have to look further into this to really have a good idea of what the
implications would be. Advice/ideas?

Thanks.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
