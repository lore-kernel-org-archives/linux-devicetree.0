From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Thu, 30 Jun 2016 11:50:41 +0300
Message-ID: <87inwr6owu.fsf@kamboji.qca.qualcomm.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
	<CAOiHx=n6itfmvwYQh+jUSDNguQFkos=MzjkDWP=GsupdgvF6KQ@mail.gmail.com>
	<b49a9e4b-d591-d978-8005-413f39ebf2bd@redhat.com>
	<871t3gdj6p.fsf@purkki.adurom.net>
	<ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com>
	<f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
	<fa0bf74d-cba3-0853-753c-64fe049105aa@broadcom.com>
Reply-To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQYFH77QIORBZ522O5QKGQEDEGNMTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <fa0bf74d-cba3-0853-753c-64fe049105aa-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> (Arend Van
	Spriel's message of "Wed, 29 Jun 2016 20:57:35 +0200")
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless@vger.kernel.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

>>> Typical wifi devices will have some sort of non volatile storage
>>> on board to not only store the ethernet(mac) address, but also
>>> to contain e.g. info about the antenna gain so that the firmware
>>> and/or the driver can take the antenna gain into account and ensure
>>> that they never exceed the maximum allowed broadcast strength.
>>>
>>> However on some embedded devices there is no non-volatile storage
>>> for the wifi (for cost reasons) and instead this configuration info
>>> (which is board / pcb specific) is loaded in the form of a
>>> file which contains the contents which would normally be in the
>>> non-volatile storage.
>>>
>>> Since we are dealing with a per-board config-file here, which is
>>> loaded from the os filesystem we really need to specify a basename
>>> here as the list of possible boards is endless, so we cannot
>>> have a lookup table in the driver.
>
> As a note: For BT Marcel was playing with the idea of having a lookup
> table on the file system which would be loaded by the driver.

In ath10k we have a similar problem but in our case we can use the
subsystem id to detect what board file to use, so it's not exactly same
as yours. In our board-2.bin we have identifiers like this from which
ath10k selects the correct board file:

bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=334e
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3360
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3361

-- 
Kalle Valo
