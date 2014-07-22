From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv9 0/4] Common Mailbox Framework
Date: Wed, 23 Jul 2014 00:24:10 +0530
Message-ID: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,
  Here is the next revision of Mailbox framwork.

Changes since v8:
 o Nits like spelling corrections and a couple symbol renames
 o Made 'mbox-names' optional in favor of index of mailbox
   specifier in 'mboxes' property. Which results in
     mbox_request_channel(struct mbox_client *cl)
	to
     mbox_request_channel(struct mbox_client *cl, int index)
 o Separate out Documentation and Bindings patches.

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


Jassi Brar (3):
  mailbox: Introduce framework for mailbox
  doc: add documentation for mailbox framework
  dt: mailbox: add generic bindings

Suman Anna (1):
  mailbox: rename pl320-ipc specific mailbox.h

 .../devicetree/bindings/mailbox/mailbox.txt        |  36 ++
 Documentation/mailbox.txt                          | 122 ++++++
 MAINTAINERS                                        |   8 +
 arch/arm/mach-highbank/highbank.c                  |   2 +-
 drivers/cpufreq/highbank-cpufreq.c                 |   2 +-
 drivers/mailbox/Makefile                           |   4 +
 drivers/mailbox/mailbox.c                          | 467 +++++++++++++++++++++
 drivers/mailbox/pl320-ipc.c                        |   2 +-
 include/linux/mailbox_client.h                     |  45 ++
 include/linux/mailbox_controller.h                 | 131 ++++++
 include/linux/{mailbox.h => pl320-ipc.h}           |   0
 11 files changed, 816 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt
 create mode 100644 Documentation/mailbox.txt
 create mode 100644 drivers/mailbox/mailbox.c
 create mode 100644 include/linux/mailbox_client.h
 create mode 100644 include/linux/mailbox_controller.h
 rename include/linux/{mailbox.h => pl320-ipc.h} (100%)

-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
