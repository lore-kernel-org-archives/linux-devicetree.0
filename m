From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v7 1/2] Bluetooth: hci_qca: Added support for WCN3998
Date: Thu, 25 Apr 2019 09:46:44 -0700
Message-ID: <20190425164644.GG112750@google.com>
References: <1556194416-30842-1-git-send-email-c-hbandi@codeaurora.org>
 <1556194416-30842-2-git-send-email-c-hbandi@codeaurora.org>
 <08C6CC93-45C7-468E-AFC3-251507FA678E@holtmann.org>
 <2172b21d6b936c0befca1a608ae297c1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2172b21d6b936c0befca1a608ae297c1@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2019 at 07:10:51PM +0530, Harish Bandi wrote:
> Hi Marcel,
> 
> On 2019-04-25 18:17, Marcel Holtmann wrote:
> > Hi Harish,
> > 
> > > Added new compatible for WCN3998 and corresponding voltage
> > > and current values to WCN3998 compatible.
> > > Changed driver code to support WCN3998
> > > 
> > > Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > > Changes in V7:
> > > - Initialized rom_ver to 0 to fix compiler warning
> > > ---
> > > drivers/bluetooth/btqca.c   | 12 +++++++++---
> > > drivers/bluetooth/btqca.h   |  8 +++++++-
> > > drivers/bluetooth/hci_qca.c | 40
> > > ++++++++++++++++++++++++++--------------
> > > 3 files changed, 42 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > > index 6122685..495a52f 100644
> > > --- a/drivers/bluetooth/btqca.c
> > > +++ b/drivers/bluetooth/btqca.c
> > > @@ -336,7 +336,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t
> > > baudrate,
> > > {
> > > 	struct rome_config config;
> > > 	int err;
> > > -	u8 rom_ver;
> > > +	u8 rom_ver = 0;
> > 
> > what is this change for?
> [Harish] - kbuild test robot gave compiler warning. So initialized.
> drivers/bluetooth/btqca.c:369:3: warning: 'rom_ver' may be used
> uninitialized in this function [-Wmaybe-uninitialized]
> 
> > 
> > > 	bt_dev_dbg(hdev, "QCA setup on UART");
> > > 
> > > @@ -344,7 +344,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t
> > > baudrate,
> > > 
> > > 	/* Download rampatch file */
> > > 	config.type = TLV_TYPE_PATCH;
> > > -	if (soc_type == QCA_WCN3990) {
> > > +	if (qca_is_wcn399x(soc_type)) {
> > > 		/* Firmware files to download are based on ROM version.
> > > 		 * ROM version is derived from last two bytes of soc_ver.
> > > 		 */
> > > @@ -365,7 +365,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t
> > > baudrate,
> > > 
> > > 	/* Download NVM configuration */
> > > 	config.type = TLV_TYPE_NVM;
> > > -	if (soc_type == QCA_WCN3990)
> > > +	if (qca_is_wcn399x(soc_type))
> > > 		snprintf(config.fwname, sizeof(config.fwname),
> > > 			 "qca/crnv%02x.bin", rom_ver);
> > > 	else
> > > @@ -410,6 +410,12 @@ int qca_set_bdaddr(struct hci_dev *hdev, const
> > > bdaddr_t *bdaddr)
> > > }
> > > EXPORT_SYMBOL_GPL(qca_set_bdaddr);
> > > 
> > > +bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
> > > +{
> > > +	return ((soc_type == QCA_WCN3990) || (soc_type == QCA_WCN3998));
> > 
> > no () needed around soc_type = check.
> 
> [Harish]  - OK, will change it.
> > 
> > > +}
> > > +EXPORT_SYMBOL_GPL(qca_is_wcn399x);
> > > +
> > 
> > Why is this exported. Make this an inline function in btqca.h.
> [Harish] - This was used in btqca.c also to check the soc_type

true, but this is still possible with an inline function in btqca.h.
