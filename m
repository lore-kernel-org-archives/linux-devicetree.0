From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 3/3] Bluetooth: btqcomsmd: retrieve BD address from DT
 property
Date: Fri, 8 Sep 2017 17:31:14 +0200
Message-ID: <AA9FCC78-BFEC-4944-B91F-DCDE6F455DBB@holtmann.org>
References: <1504879075-587-1-git-send-email-loic.poulain@linaro.org>
 <1504879075-587-3-git-send-email-loic.poulain@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504879075-587-3-git-send-email-loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bluez mailing list <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Loic,

> Retrieve BD address from the local-bd-address property.
> This address must be unique and is usually added in the DT
> by the bootloader which has access to the provisioned data.
> 
> Signed-off-by: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> v2: Set device as unconfigured if default address detected
>     Add warning if BD addr retrieved from DT
> v3: if no addr retrieved from DT, unconditionally set
>     the invalid BD addr flag.
>     swap and set bdaddr in the platform probe
> v4: Add dt-bindings documentation
>     split patch in two parts (setup, dt prop)
>     use local-bd-address name instead of local-mac-address
> v5: remove 2/3 merged in bluetooth-next tree
>     Add bluetooth.txt for common BT bindings
>     expect local-bd-address in little-endian format
> v6: use of_property_read_u8_array instead of of_get_property
> v7: use dev_info instead of BT_INFO to have dev context
> 
> drivers/bluetooth/btqcomsmd.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)

all 3 patches have been applied to bluetooth-next tree.

Regards

Marcel
