From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/3] Bluetooth: btqcomsmd: retieve BD address from DT
Date: Thu, 7 Sep 2017 10:50:32 -0500
Message-ID: <CAL_JsqLVQeC9TX6g+JbYq6gX7LbRT_-oeTevwDMeX8VHRrEcXg@mail.gmail.com>
References: <1504637923-21652-1-git-send-email-loic.poulain@linaro.org>
 <1504637923-21652-3-git-send-email-loic.poulain@linaro.org>
 <CAL_JsqJhEaZkcBA6qnC3rVduQJ9Yesrz_h9i_WXo1bRaq1NT4Q@mail.gmail.com> <46A7D7AE-FDBB-424D-8E85-7180FEE24A14@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <46A7D7AE-FDBB-424D-8E85-7180FEE24A14-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 6, 2017 at 2:04 AM, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org> wrote:
> Hi Rob,
>
>>> Retrieve BD address from the DT local-bd-address property.
>>> This address must be unique and is usually added in the DT
>>> by the bootloader which has access to the provisioned data.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

[...]

>>> +       /* The local-bd-address DT property is usually injected by the
>>> +        * bootloader which has access to the allocated BD address.
>>> +        */
>>> +       bdaddr = of_get_property(pdev->dev.of_node, "local-bd-address", &ret);
>>> +       if (bdaddr && ret == sizeof(bdaddr_t)) {
>>> +               BT_INFO("BD address %pMR retrieved from device-tree", bdaddr);
>>> +               bacpy(&btq->bdaddr, bdaddr);
>>> +       }
>>
>> Can we put all this into a helper function before we get more
>> instances. And use the u8 array property function. We're trying to
>> make of_get_property an internal function.
>
> using of_property_read_u8_array seems sensible since that would shorten this into
>
>         if (!of_property_read_u8_array(pdev->dev.of_node, “local-bd-address”, &btq->bdaddr, 6))
>                 bt_dev_info(pdev->dev, “BD address %pMR ..”, &btq->bdaddr);
>

Yes.

> Creating a Bluetooth internal helper function seems rather pointless at this stage. If more users appears, then we might need to move this into the Bluetooth core to deal with this. However as said before, I am not a big fan of IEEE address assignment via DT since that forces to have the smarts in the boot loader and the boot loader doing the right thing. There are too many boards and DT where this will not be true. In a lot of cases it would make more sense to store the BD address as part of your file system. Since we do support this in a total generic fashion, I rather push for that method and have the QCOM SMD based SoC being the exception.

Okay, sounds reasonable and it's your call anyway.

Rob

BTW, your mails are always quoted-printable encoding which shouldn't
be used on lists AIUI.
