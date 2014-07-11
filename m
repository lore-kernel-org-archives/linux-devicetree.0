From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv8 0/2] Common Mailbox Framework
Date: Fri, 11 Jul 2014 15:02:47 +0530
Message-ID: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,
  Here is the next revision of Mailbox framwork.

Changes since v7:
 o Added documentation and example usage.
 o Merged all patches into one that create api, bindings and
   documentation.

Changes since v6:
 o Separate out generic DT bindings patch.
 o Discard unnecessary aligned attributes.

Changes since v5:
 o Use standard error types instead of special type mbox_result.
 o Constify client struct in request_channel
 o Use reinit_completion instead of init_completion every time.
 o Improve commentary in bindings and code.

Changes since v4:
 o Common DT binding for Controller and Client drivers
    As a result, discard string based channel matching
 o Provide for an atomic 'peek' api, that a client could
    call to trigger the controller driver push data upwards.
 o OMAP and Highbank conversion to new api is left out, which
    can be converted later by the developers.

Changes since v3:
 o Change name of symbols from ipc to mbox
 o Return real types instead of void *
 o Align structures
 o Change some symbol names
	rxcb -> rx_callback
	txcb -> tx_done
 o Added kernel-doc for exported API
 o Dropped the cl_id and use clients pointer for callbacks.
 o Fixed locking of channel pool
 o Return negative error code for unsuccessful ipc_send_message()
 o Module referencing during mailbox assignment to a client.
 o Made error code symbols specific to mailbox.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
