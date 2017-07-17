From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: da850-evm: drop VPIF endpoints
Date: Mon, 17 Jul 2017 10:47:38 -0700
Message-ID: <7hzic3t0p1.fsf@baylibre.com>
References: <20170615215730.28585-1-khilman@baylibre.com>
        <55429c4a-987d-a157-9565-eef04daeefea@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55429c4a-987d-a157-9565-eef04daeefea-l0cyMroinI0@public.gmane.org> (Sekhar Nori's
        message of "Mon, 17 Jul 2017 16:30:33 +0530")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> writes:

> Hi Kevin,
>
> On Friday 16 June 2017 03:27 AM, Kevin Hilman wrote:
>> Drop the unused endpoints.  They should only be used when there is
>> an actual remote-endpoint connected.
>> 
>> Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> A similar patch is needed for da850-lcdk too. In fact with v4.13-rc1, 
> without it, we get a warning splat that starts with:
>
> WARNING: CPU: 0 PID: 129 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x5c/0x7c
> sysfs: cannot create duplicate filename '/bus/platform/devices/vpif_capture'
>
> I am adding this patch to fixes and would like to send this along with 
> a similar LCDK patch (hopefully both for -rc2). While committing this I 
> will add "unused" to subject line too.

Patch for LCDK sent, with "unused" added to the subject line.

Kevin



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
