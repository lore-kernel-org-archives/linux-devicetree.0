Return-Path: <SRS0=UJz4=IY=gmail.com=mats.dev.list@kernel.org>
Subject: Re: [PATCH v6 00/15] staging: typec: tcpci: move out of staging
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <1ce9509d-8b41-0b66-40d8-2d7badc972eb@gmail.com>
Date: Wed, 6 Jun 2018 23:44:33 +0200
MIME-Version: 1.0
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hello Li Jun,

I have been testing these patches on top of usb-next using an i.MX6,
a nxp ptn5110 evaluation board and a bunch of usbc devices. So far
everything seem to work fine! :-)
However, I have only tested host mode and I have some test cases
left I want to cover.

Just to let you know your patches are not forgotten :-)

BR // Mats

On 2018-05-28 04:52, Li Jun wrote:
> This patch set attempts to move the tcpci drivers out of staging by fix
> some tcpci driver issues and define typec and power delivery device
> properties, the changes are verified on NXP PTN5110, which is a standard
> tcpci typec port controller device with power delivery support, tested
> power source and sink with drp config.
>
> Changes for v6:
> - Change function name to be typec_find_port_power/data_role for find
>    capability, and typec_find_power_role for find one specific power role.
> - Fix rt1711h driver move missing.
> - Add one patch to improve the error checking in tcpci driver, use IS_ERR()
>    instead of PTR_ERR_OR_ZERO().
> - Add Rob's Reviewed-by for patch [2/15].
> - Misc typos fix.
>   
> Changes for v5:
> - Use "power-role" and "data-role" for typec port power and data capability
>    property name.
> - Use macro defintion instead of cryptic numbers for readability of
>    power delivery properties(PDO).
> - Add one tcpci driver binding string to be "nxp,ptn5110" to follow binding
>    name rule "<vendor prefix>,<device>".
> - Change operating power property name to be op-sink-microwatt.
> - Add one patch(remove unused tcpci_tcpc_config) to resolve bisectablitity
>    issue of patch usb: typec: add fwnode to tcpc.
> - A minor error handling change to keep the error path and success path
>    separate in patch: register port before request irq
> - Rebase to latest Greg's tree with max_snk_* removed.
>
> Changes for v4:
> - Remove max-sink-* properties as we will purge max_snk_* in tcpm,
>    see patch set[4].
> - Get typec power and data type value via name string(patch 5).
> - Move finding typec and pd properties code from tcpci to tcpm(patch 6)
> - Add a compatible string for nxp ptn5110 typec controller in tcpci driver.
>    (patch 3)
> - Add set cc for drp toggling without try.src/snk in tcpm(patch 10), then
>    patch 11 can only update CCx bits for keep disconnect cc line open.
> - Update op-sink-microwatt-hours example value to be the right value in
>    micorwatts, and accordingly divide 1000 to get its miliwatts value
>    in patch 6.
> - Add Guenter's Reviewed-by for patch(8/9/12)
>
> [4] https://www.spinics.net/lists/linux-usb/msg167261.html
>
> Changes for v3:
> - Use 2 properties to separate power and data capability of typec port:
>    "power-type" and "data-type", this is based on Heikki's typec class code
>    change[2]. use "try-power-role" to present if the typec port can support
>    Try.SNK or Try.SRC.
> - 4 sink properties(max_sink_mv/ma/mw and op_sink_mw) are kept because the
>    counterpart code is back, see revert patch[3], meanwhile I post a patch
>    to fix the reported problem of current source pdo select machinism(which
>    completely ignored those 4 sink settings), to see if we can keep current
>    code, once it was discussed and have conclusion I can update this
>    accordingly.
> - Use fwnode to get the connector node for dt setting parse.
>
> Main changes for v2:
> - Typec properties are based on general usb connector bindings[1] proposed
>    by Andrzej Hajda, use the standard unit suffixes as defined in
>    property-units.txt.
> - Add 2 infra APIs to get power sink and source config from dt.
> - Don't change the set_cc api, to keep the uncontacted cc line open,
>    set cc1/cc2 to be open in tcpci driver when set polarity.
> - Directly enable vbus detect in tcpci driver rather than add a API.
> - Details added in each patch.
>
> [1] https://patchwork.kernel.org/patch/10231447/
> [2] https://patchwork.kernel.org/patch/10276483/
> [3] https://www.spinics.net/lists/linux-usb/msg166366.html
>
> Li Jun (14):
>    dt-bindings: connector: add properties for typec
>    dt-bindings: usb: add documentation for typec port controller(TCPCI)
>    staging: typec: tcpci: add compatible string for nxp ptn5110
>    usb: typec: add fwnode to tcpc
>    usb: typec: add API to get typec basic port power and data config
>    usb: typec: tcpm: support get typec and pd config from device
>      properties
>    staging: typec: tcpci: remove unused tcpci_tcpc_config
>    staging: typec: tcpci: use IS_ERR() instead of PTR_ERR_OR_ZERO()
>    staging: typec: tcpci: enable vbus detection
>    typec: tcpm: add starting value for drp toggling
>    usb: typec: tcpm: set cc for drp toggling attach
>    staging: typec: tcpci: keep the disconnected cc line open
>    staging: typec: tcpci: Only touch target bit when enable vconn
>    staging: typec: tcpci: move tcpci drivers out of staging
>
> Peter Chen (1):
>    staging: typec: tcpci: register port before request irq
>
>   .../bindings/connector/usb-connector.txt           |  44 ++++++
>   .../devicetree/bindings/usb/typec-tcpci.txt        |  49 +++++++
>   drivers/staging/Kconfig                            |   2 -
>   drivers/staging/Makefile                           |   1 -
>   drivers/staging/typec/Kconfig                      |  22 ---
>   drivers/staging/typec/Makefile                     |   2 -
>   drivers/staging/typec/TODO                         |   5 -
>   drivers/usb/typec/Kconfig                          |  15 +++
>   drivers/usb/typec/Makefile                         |   2 +
>   drivers/usb/typec/class.c                          |  50 +++++++
>   drivers/{staging => usb}/typec/tcpci.c             |  66 +++++----
>   drivers/{staging => usb}/typec/tcpci.h             |   0
>   drivers/{staging => usb}/typec/tcpci_rt1711h.c     |   0
>   drivers/usb/typec/tcpm.c                           | 148 +++++++++++++++++----
>   include/dt-bindings/usb/pd.h                       |  62 +++++++++
>   include/linux/usb/tcpm.h                           |   2 +
>   include/linux/usb/typec.h                          |   3 +
>   17 files changed, 389 insertions(+), 84 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/typec-tcpci.txt
>   delete mode 100644 drivers/staging/typec/Kconfig
>   delete mode 100644 drivers/staging/typec/Makefile
>   delete mode 100644 drivers/staging/typec/TODO
>   rename drivers/{staging => usb}/typec/tcpci.c (92%)
>   rename drivers/{staging => usb}/typec/tcpci.h (100%)
>   rename drivers/{staging => usb}/typec/tcpci_rt1711h.c (100%)
>   create mode 100644 include/dt-bindings/usb/pd.h
>
