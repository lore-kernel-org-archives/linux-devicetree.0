From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] OF: DT-Overlay configfs interface
Date: Fri, 21 Mar 2014 14:56:37 +0100
Message-ID: <532C4515.3040500@gmail.com>
References: <1395179766-31575-1-git-send-email-pantelis.antoniou@konsulko.com> <1395179766-31575-4-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqKJqakXGWDEKPAoJ9P5myYXnodcYCdvowV6MPuZXgwVmw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKJqakXGWDEKPAoJ9P5myYXnodcYCdvowV6MPuZXgwVmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev@kons>
List-Id: devicetree@vger.kernel.org

On 03/21/2014 02:39 PM, Rob Herring wrote:
> On Tue, Mar 18, 2014 at 4:56 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Add a runtime interface to using configfs for generic device tree overlay
>> usage.
>>
>> A device-tree configfs entry is created in /config/device-tree/overlays
>>
>> To create an overlay you mkdir the directory and then echo the overlay
>> firmware file to the path property file.
>>
>>          # mkdir /config/device-tree/overlays/foo
>>          # echo foo.dtbo >/config/device-tree/overlays/foo/path
[...]
>> +static ssize_t cfs_overlay_item_status_show(struct cfs_overlay_item *overlay,
>> +               char *page)
>> +{
>> +       return sprintf(page, "%s\n",
>> +                       overlay->applied ? "applied" : "unapplied");
>> +}
>
> This needs to be added to the above mentioned documentation along with
> any other files.

It is also terrible to grep for. Maybe just have the file named
"applied" and use a bool instead?

Sebastian

>> +
>> +CFS_OVERLAY_ITEM_ATTR(path, S_IRUGO | S_IWUSR, \
>> +               cfs_overlay_item_path_show, cfs_overlay_item_path_store);
>> +CFS_OVERLAY_ITEM_ATTR_RO(status, cfs_overlay_item_status_show);
>> +
>> +static struct configfs_attribute *cfs_overlay_attrs[] = {
>> +       &cfs_overlay_item_attr_path.attr,
>> +       &cfs_overlay_item_attr_status.attr,
>> +       NULL,
>> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
