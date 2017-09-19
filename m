From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-bindings: vendor-prefixes: align indentation of company names
Date: Tue, 19 Sep 2017 11:53:22 -0500
Message-ID: <20170919165322.9448-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

There's a mixture of indentation, so align all the company names
indentation to 16 characters (2 tabs).

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Will be sending this to Linus for rc2 to avoid conflicts later.

 .../devicetree/bindings/vendor-prefixes.txt        | 570 ++++++++++-----------
 1 file changed, 285 insertions(+), 285 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0d52d9799eef..0a0034aba440 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -3,384 +3,384 @@ Device tree binding vendor prefix registry.  Keep list in alphabetical order.
 This isn't an exhaustive list, but you should add new prefixes to it before
 using them to avoid name-space collisions.
 
-abilis	Abilis Systems
-abracon	Abracon Corporation
-actions	Actions Semiconductor Co., Ltd.
+abilis		Abilis Systems
+abracon		Abracon Corporation
+actions		Actions Semiconductor Co., Ltd.
 active-semi	Active-Semi International Inc
-ad	Avionic Design GmbH
+ad		Avionic Design GmbH
 adapteva	Adapteva, Inc.
 adaptrum	Adaptrum, Inc.
-adh	AD Holdings Plc.
-adi	Analog Devices, Inc.
+adh		AD Holdings Plc.
+adi		Analog Devices, Inc.
 advantech	Advantech Corporation
 aeroflexgaisler	Aeroflex Gaisler AB
-al	Annapurna Labs
+al		Annapurna Labs
 allwinner	Allwinner Technology Co., Ltd.
 alphascale	AlphaScale Integrated Circuits Systems, Inc.
-altr	Altera Corp.
-amazon	Amazon.com, Inc.
-amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
-amd	Advanced Micro Devices (AMD), Inc.
-amlogic	Amlogic, Inc.
-ampire	Ampire Co., Ltd.
-ams	AMS AG
-amstaos	AMS-Taos Inc.
+altr		Altera Corp.
+amazon		Amazon.com, Inc.
+amcc		Applied Micro Circuits Corporation (APM, formally AMCC)
+amd		Advanced Micro Devices (AMD), Inc.
+amlogic		Amlogic, Inc.
+ampire		Ampire Co., Ltd.
+ams		AMS AG
+amstaos		AMS-Taos Inc.
 analogix	Analogix Semiconductor, Inc.
 andestech	Andes Technology Corporation
-apm	Applied Micro Circuits Corporation (APM)
-aptina	Aptina Imaging
-arasan	Arasan Chip Systems
-arctic	Arctic Sand
-aries	Aries Embedded GmbH
-arm	ARM Ltd.
+apm		Applied Micro Circuits Corporation (APM)
+aptina		Aptina Imaging
+arasan		Arasan Chip Systems
+arctic		Arctic Sand
+aries		Aries Embedded GmbH
+arm		ARM Ltd.
 armadeus	ARMadeus Systems SARL
-arrow	Arrow Electronics
-artesyn	Artesyn Embedded Technologies Inc.
+arrow		Arrow Electronics
+artesyn		Artesyn Embedded Technologies Inc.
 asahi-kasei	Asahi Kasei Corp.
-aspeed	ASPEED Technology Inc.
-atlas	Atlas Scientific LLC
-atmel	Atmel Corporation
-auo	AU Optronics Corporation
-auvidea Auvidea GmbH
-avago	Avago Technologies
-avia	avia semiconductor
-avic	Shanghai AVIC Optoelectronics Co., Ltd.
-axentia	Axentia Technologies AB
-axis	Axis Communications AB
-bananapi BIPAI KEJI LIMITED
-bhf	Beckhoff Automation GmbH & Co. KG
-boe	BOE Technology Group Co., Ltd.
-bosch	Bosch Sensortec GmbH
+aspeed		ASPEED Technology Inc.
+atlas		Atlas Scientific LLC
+atmel		Atmel Corporation
+auo		AU Optronics Corporation
+auvidea 	Auvidea GmbH
+avago		Avago Technologies
+avia		avia semiconductor
+avic		Shanghai AVIC Optoelectronics Co., Ltd.
+axentia		Axentia Technologies AB
+axis		Axis Communications AB
+bananapi	BIPAI KEJI LIMITED
+bhf		Beckhoff Automation GmbH & Co. KG
+boe		BOE Technology Group Co., Ltd.
+bosch		Bosch Sensortec GmbH
 boundary	Boundary Devices Inc.
-brcm	Broadcom Corporation
-buffalo	Buffalo, Inc.
-calxeda	Calxeda
-capella	Capella Microsystems, Inc
-cascoda	Cascoda, Ltd.
-cavium	Cavium, Inc.
-cdns	Cadence Design Systems Inc.
-ceva	Ceva, Inc.
+brcm		Broadcom Corporation
+buffalo		Buffalo, Inc.
+calxeda		Calxeda
+capella		Capella Microsystems, Inc
+cascoda		Cascoda, Ltd.
+cavium		Cavium, Inc.
+cdns		Cadence Design Systems Inc.
+ceva		Ceva, Inc.
 chipidea	Chipidea, Inc
 chipone		ChipOne
 chipspark	ChipSPARK
-chrp	Common Hardware Reference Platform
+chrp		Common Hardware Reference Platform
 chunghwa	Chunghwa Picture Tubes Ltd.
-ciaa	Computadora Industrial Abierta Argentina
-cirrus	Cirrus Logic, Inc.
+ciaa		Computadora Industrial Abierta Argentina
+cirrus		Cirrus Logic, Inc.
 cloudengines	Cloud Engines, Inc.
-cnm	Chips&Media, Inc.
-cnxt	Conexant Systems, Inc.
+cnm		Chips&Media, Inc.
+cnxt		Conexant Systems, Inc.
 compulab	CompuLab Ltd.
-cortina	Cortina Systems, Inc.
-cosmic	Cosmic Circuits
+cortina		Cortina Systems, Inc.
+cosmic		Cosmic Circuits
 creative	Creative Technology Ltd
 crystalfontz	Crystalfontz America, Inc.
 cubietech	Cubietech, Ltd.
-cypress	Cypress Semiconductor Corporation
-cznic	CZ.NIC, z.s.p.o.
-dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
-davicom	DAVICOM Semiconductor, Inc.
-delta	Delta Electronics, Inc.
-denx	Denx Software Engineering
+cypress		Cypress Semiconductor Corporation
+cznic		CZ.NIC, z.s.p.o.
+dallas		Maxim Integrated Products (formerly Dallas Semiconductor)
+davicom		DAVICOM Semiconductor, Inc.
+delta		Delta Electronics, Inc.
+denx		Denx Software Engineering
 devantech	Devantech, Ltd.
-digi	Digi International Inc.
+digi		Digi International Inc.
 digilent	Diglent, Inc.
-dioo	Dioo Microcircuit Co., Ltd
-dlg	Dialog Semiconductor
-dlink	D-Link Corporation
-dmo	Data Modul AG
+dioo		Dioo Microcircuit Co., Ltd
+dlg		Dialog Semiconductor
+dlink		D-Link Corporation
+dmo		Data Modul AG
 domintech	Domintech Co., Ltd.
 dongwoon	Dongwoon Anatech
 dptechnics	DPTechnics
-dragino	Dragino Technology Co., Limited
-ea	Embedded Artists AB
-ebv	EBV Elektronik
-edt	Emerging Display Technologies
-eeti	eGalax_eMPIA Technology Inc
-elan	Elan Microelectronic Corp.
-embest	Shenzhen Embest Technology Co., Ltd.
-emmicro	EM Microelectronic
+dragino		Dragino Technology Co., Limited
+ea		Embedded Artists AB
+ebv		EBV Elektronik
+edt		Emerging Display Technologies
+eeti		eGalax_eMPIA Technology Inc
+elan		Elan Microelectronic Corp.
+embest		Shenzhen Embest Technology Co., Ltd.
+emmicro		EM Microelectronic
 energymicro	Silicon Laboratories (formerly Energy Micro AS)
-engicam	Engicam S.r.l.
-epcos	EPCOS AG
-epfl	Ecole Polytechnique Fédérale de Lausanne
-epson	Seiko Epson Corp.
-est	ESTeem Wireless Modems
-ettus	NI Ettus Research
-eukrea  Eukréa Electromatique
-everest	Everest Semiconductor Co. Ltd.
+engicam		Engicam S.r.l.
+epcos		EPCOS AG
+epfl		Ecole Polytechnique Fédérale de Lausanne
+epson		Seiko Epson Corp.
+est		ESTeem Wireless Modems
+ettus		NI Ettus Research
+eukrea  	Eukréa Electromatique
+everest		Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
-exar	Exar Corporation
-excito	Excito
-ezchip	EZchip Semiconductor
-faraday	Faraday Technology Corporation
-fcs	Fairchild Semiconductor
-firefly	Firefly
+exar		Exar Corporation
+excito		Excito
+ezchip		EZchip Semiconductor
+faraday		Faraday Technology Corporation
+fcs		Fairchild Semiconductor
+firefly		Firefly
 focaltech	FocalTech Systems Co.,Ltd
 friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
-fsl	Freescale Semiconductor
-fujitsu	Fujitsu Ltd.
-ge	General Electric Company
+fsl		Freescale Semiconductor
+fujitsu		Fujitsu Ltd.
+ge		General Electric Company
 geekbuying	GeekBuying
-gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
-GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+gef		GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+GEFanuc		GE Fanuc Intelligent Platforms Embedded Systems, Inc.
 geniatech	Geniatech, Inc.
 giantplus	Giantplus Technology Co., Ltd.
 globalscale	Globalscale Technologies, Inc.
-gmt	Global Mixed-mode Technology, Inc.
-goodix	Shenzhen Huiding Technology Co., Ltd.
-google	Google, Inc.
-grinn	Grinn
-grmn	Garmin Limited
-gumstix	Gumstix, Inc.
-gw	Gateworks Corporation
+gmt		Global Mixed-mode Technology, Inc.
+goodix		Shenzhen Huiding Technology Co., Ltd.
+google		Google, Inc.
+grinn		Grinn
+grmn		Garmin Limited
+gumstix		Gumstix, Inc.
+gw		Gateworks Corporation
 hannstar	HannStar Display Corporation
-haoyu	Haoyu Microelectronic Co. Ltd.
+haoyu		Haoyu Microelectronic Co. Ltd.
 hardkernel	Hardkernel Co., Ltd
-himax	Himax Technologies, Inc.
+himax		Himax Technologies, Inc.
 hisilicon	Hisilicon Limited.
-hit	Hitachi Ltd.
-hitex	Hitex Development Tools
-holt	Holt Integrated Circuits, Inc.
+hit		Hitachi Ltd.
+hitex		Hitex Development Tools
+holt		Holt Integrated Circuits, Inc.
 honeywell	Honeywell
-hp	Hewlett Packard
-holtek	Holtek Semiconductor, Inc.
-hwacom	HwaCom Systems Inc.
-i2se	I2SE GmbH
-ibm	International Business Machines (IBM)
-idt	Integrated Device Technologies, Inc.
-ifi	Ingenieurburo Fur Ic-Technologie (I/F/I)
-img	Imagination Technologies Ltd.
-infineon Infineon Technologies
-inforce	Inforce Computing
-ingenic	Ingenic Semiconductor
-innolux	Innolux Corporation
+hp		Hewlett Packard
+holtek		Holtek Semiconductor, Inc.
+hwacom		HwaCom Systems Inc.
+i2se		I2SE GmbH
+ibm		International Business Machines (IBM)
+idt		Integrated Device Technologies, Inc.
+ifi		Ingenieurburo Fur Ic-Technologie (I/F/I)
+img		Imagination Technologies Ltd.
+infineon	Infineon Technologies
+inforce		Inforce Computing
+ingenic		Ingenic Semiconductor
+innolux		Innolux Corporation
 inside-secure	INSIDE Secure
-intel	Intel Corporation
+intel		Intel Corporation
 intercontrol	Inter Control Group
 invensense	InvenSense Inc.
 inversepath	Inverse Path
-iom	Iomega Corporation
-isee	ISEE 2007 S.L.
-isil	Intersil
-issi	Integrated Silicon Solutions Inc.
-itead	ITEAD Intelligent Systems Co.Ltd
-iwave  iWave Systems Technologies Pvt. Ltd.
-jdi	Japan Display Inc.
-jedec	JEDEC Solid State Technology Association
-karo	Ka-Ro electronics GmbH
+iom		Iomega Corporation
+isee		ISEE 2007 S.L.
+isil		Intersil
+issi		Integrated Silicon Solutions Inc.
+itead		ITEAD Intelligent Systems Co.Ltd
+iwave		iWave Systems Technologies Pvt. Ltd.
+jdi		Japan Display Inc.
+jedec		JEDEC Solid State Technology Association
+karo		Ka-Ro electronics GmbH
 keithkoep	Keith & Koep GmbH
-keymile	Keymile GmbH
-khadas	Khadas
-kinetic Kinetic Technologies
+keymile		Keymile GmbH
+khadas		Khadas
+kinetic 	Kinetic Technologies
 kingnovel	Kingnovel Technology Co., Ltd.
-kosagi	Sutajio Ko-Usagi PTE Ltd.
-kyo	Kyocera Corporation
-lacie	LaCie
-lantiq	Lantiq Semiconductor
-lattice	Lattice Semiconductor
-lego	LEGO Systems A/S
-lenovo	Lenovo Group Ltd.
-lg	LG Corporation
+kosagi		Sutajio Ko-Usagi PTE Ltd.
+kyo		Kyocera Corporation
+lacie		LaCie
+lantiq		Lantiq Semiconductor
+lattice		Lattice Semiconductor
+lego		LEGO Systems A/S
+lenovo		Lenovo Group Ltd.
+lg		LG Corporation
 libretech	Shenzhen Libre Technology Co., Ltd
 licheepi	Lichee Pi
-linaro	Linaro Limited
-linksys	Belkin International, Inc. (Linksys)
-linux	Linux-specific binding
-lltc	Linear Technology Corporation
-lsi	LSI Corp. (LSI Logic)
-lwn	Liebherr-Werk Nenzing GmbH
-macnica	Macnica Americas
-marvell	Marvell Technology Group Ltd.
-maxim	Maxim Integrated Products
-mcube	mCube
-meas	Measurement Specialties
+linaro		Linaro Limited
+linksys		Belkin International, Inc. (Linksys)
+linux		Linux-specific binding
+lltc		Linear Technology Corporation
+lsi		LSI Corp. (LSI Logic)
+lwn		Liebherr-Werk Nenzing GmbH
+macnica		Macnica Americas
+marvell		Marvell Technology Group Ltd.
+maxim		Maxim Integrated Products
+mcube		mCube
+meas		Measurement Specialties
 mediatek	MediaTek Inc.
 megachips	MegaChips
-melexis	Melexis N.V.
-melfas	MELFAS Inc.
+melexis		Melexis N.V.
+melfas		MELFAS Inc.
 mellanox	Mellanox Technologies
-memsic	MEMSIC Inc.
-merrii	Merrii Technology Co., Ltd.
-micrel	Micrel Inc.
+memsic		MEMSIC Inc.
+merrii		Merrii Technology Co., Ltd.
+micrel		Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
-micron	Micron Technology Inc.
-minix	MINIX Technology Ltd.
+micron		Micron Technology Inc.
+minix		MINIX Technology Ltd.
 miramems	MiraMEMS Sensing Technology Co., Ltd.
 mitsubishi	Mitsubishi Electric Corporation
 mosaixtech	Mosaix Technologies, Inc.
 motorola	Motorola, Inc.
-moxa	Moxa Inc.
-mpl	MPL AG
-mqmaker	mqmaker Inc.
-msi	Micro-Star International Co. Ltd.
-mti	Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
+moxa		Moxa Inc.
+mpl		MPL AG
+mqmaker		mqmaker Inc.
+msi		Micro-Star International Co. Ltd.
+mti		Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
 multi-inno	Multi-Inno Technology Co.,Ltd
 mundoreader	Mundo Reader S.L.
-murata	Murata Manufacturing Co., Ltd.
-mxicy	Macronix International Co., Ltd.
-myir	MYIR Tech Limited
+murata		Murata Manufacturing Co., Ltd.
+mxicy		Macronix International Co., Ltd.
+myir		MYIR Tech Limited
 national	National Semiconductor
-nec	NEC LCD Technologies, Ltd.
+nec		NEC LCD Technologies, Ltd.
 neonode		Neonode Inc.
-netgear	NETGEAR
+netgear		NETGEAR
 netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netron-dy	Netron DY
 netxeon		Shenzhen Netxeon Technology CO., LTD
-nexbox	Nexbox
+nexbox		Nexbox
 newhaven	Newhaven Display International
-ni	National Instruments
+ni		National Instruments
 nintendo	Nintendo
-nlt	NLT Technologies, Ltd.
-nokia	Nokia
-nordic	Nordic Semiconductor
+nlt		NLT Technologies, Ltd.
+nokia		Nokia
+nordic		Nordic Semiconductor
 nutsboard	NutsBoard
-nuvoton	Nuvoton Technology Corporation
-nvd	New Vision Display
-nvidia	NVIDIA
-nxp	NXP Semiconductors
-okaya	Okaya Electric America, Inc.
-oki	Oki Electric Industry Co., Ltd.
-olimex	OLIMEX Ltd.
-onion	Onion Corporation
-onnn	ON Semiconductor Corp.
-ontat	On Tat Industrial Company
+nuvoton		Nuvoton Technology Corporation
+nvd		New Vision Display
+nvidia		NVIDIA
+nxp		NXP Semiconductors
+okaya		Okaya Electric America, Inc.
+oki		Oki Electric Industry Co., Ltd.
+olimex		OLIMEX Ltd.
+onion		Onion Corporation
+onnn		ON Semiconductor Corp.
+ontat		On Tat Industrial Company
 opencores	OpenCores.org
-option	Option NV
-ORCL	Oracle Corporation
+option		Option NV
+ORCL		Oracle Corporation
 ortustech	Ortus Technology Co., Ltd.
-ovti	OmniVision Technologies
-oxsemi	Oxford Semiconductor, Ltd.
+ovti		OmniVision Technologies
+oxsemi		Oxford Semiconductor, Ltd.
 panasonic	Panasonic Corporation
-parade	Parade Technologies Inc.
-pericom	Pericom Technology Inc.
+parade		Parade Technologies Inc.
+pericom		Pericom Technology Inc.
 pervasive	Pervasive Displays, Inc.
-phytec	PHYTEC Messtechnik GmbH
+phytec		PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
-pine64	Pine64
-pixcir  PIXCIR MICROELECTRONICS Co., Ltd
+pine64		Pine64
+pixcir  	PIXCIR MICROELECTRONICS Co., Ltd
 plathome	Plat'Home Co., Ltd.
-plda	PLDA
-poslab	Poslab Technology Co., Ltd.
-powervr	PowerVR (deprecated, use img)
+plda		PLDA
+poslab		Poslab Technology Co., Ltd.
+powervr		PowerVR (deprecated, use img)
 pulsedlight	PulsedLight, Inc
-qca	Qualcomm Atheros, Inc.
-qcom	Qualcomm Technologies, Inc
-qemu	QEMU, a generic and open source machine emulator and virtualizer
-qi	Qi Hardware
+qca		Qualcomm Atheros, Inc.
+qcom		Qualcomm Technologies, Inc
+qemu		QEMU, a generic and open source machine emulator and virtualizer
+qi		Qi Hardware
 qiaodian	QiaoDian XianShi Corporation
-qnap	QNAP Systems, Inc.
-radxa	Radxa
+qnap		QNAP Systems, Inc.
+radxa		Radxa
 raidsonic	RaidSonic Technology GmbH
-ralink	Mediatek/Ralink Technology Corp.
-ramtron	Ramtron International
+ralink		Mediatek/Ralink Technology Corp.
+ramtron		Ramtron International
 raspberrypi	Raspberry Pi Foundation
-raydium	Raydium Semiconductor Corp.
-realtek Realtek Semiconductor Corp.
-renesas	Renesas Electronics Corporation
-richtek	Richtek Technology Corporation
-ricoh	Ricoh Co. Ltd.
+raydium		Raydium Semiconductor Corp.
+realtek 	Realtek Semiconductor Corp.
+renesas		Renesas Electronics Corporation
+richtek		Richtek Technology Corporation
+ricoh		Ricoh Co. Ltd.
 rikomagic	Rikomagic Tech Corp. Ltd
-riscv	RISC-V Foundation
+riscv		RISC-V Foundation
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
-rohm	ROHM Semiconductor Co., Ltd
-roofull	Shenzhen Roofull Technology Co, Ltd
-samsung	Samsung Semiconductor
-samtec	Samtec/Softing company
-sandisk	Sandisk Corporation
-sbs	Smart Battery System
+rohm		ROHM Semiconductor Co., Ltd
+roofull		Shenzhen Roofull Technology Co, Ltd
+samsung		Samsung Semiconductor
+samtec		Samtec/Softing company
+sandisk		Sandisk Corporation
+sbs		Smart Battery System
 schindler	Schindler
-seagate	Seagate Technology PLC
-semtech	Semtech Corporation
+seagate		Seagate Technology PLC
+semtech		Semtech Corporation
 sensirion	Sensirion AG
-sff	Small Form Factor Committee
-sgx	SGX Sensortech
-sharp	Sharp Corporation
+sff		Small Form Factor Committee
+sgx		SGX Sensortech
+sharp		Sharp Corporation
 shimafuji	Shimafuji Electric, Inc.
-si-en	Si-En Technology Ltd.
-sigma	Sigma Designs, Inc.
-sii	Seiko Instruments, Inc.
-sil	Silicon Image
-silabs	Silicon Laboratories
-silead	Silead Inc.
-silergy	Silergy Corp.
+si-en		Si-En Technology Ltd.
+sigma		Sigma Designs, Inc.
+sii		Seiko Instruments, Inc.
+sil		Silicon Image
+silabs		Silicon Laboratories
+silead		Silead Inc.
+silergy		Silergy Corp.
 siliconmitus	Silicon Mitus, Inc.
 simtek
-sirf	SiRF Technology, Inc.
-sis	Silicon Integrated Systems Corp.
+sirf		SiRF Technology, Inc.
+sis		Silicon Integrated Systems Corp.
 sitronix	Sitronix Technology Corporation
 skyworks	Skyworks Solutions, Inc.
-smsc	Standard Microsystems Corporation
-snps	Synopsys, Inc.
+smsc		Standard Microsystems Corporation
+snps		Synopsys, Inc.
 socionext	Socionext Inc.
 solidrun	SolidRun
-solomon        Solomon Systech Limited
-sony	Sony Corporation
+solomon		Solomon Systech Limited
+sony		Sony Corporation
 spansion	Spansion Inc.
-sprd	Spreadtrum Communications Inc.
-sst	Silicon Storage Technology, Inc.
-st	STMicroelectronics
-starry	Starry Electronic Technology (ShenZhen) Co., LTD
-startek	Startek
-ste	ST-Ericsson
+sprd		Spreadtrum Communications Inc.
+sst		Silicon Storage Technology, Inc.
+st		STMicroelectronics
+starry		Starry Electronic Technology (ShenZhen) Co., LTD
+startek		Startek
+ste		ST-Ericsson
 stericsson	ST-Ericsson
-summit	Summit microelectronics
-sunchip	Shenzhen Sunchip Technology Co., Ltd
-SUNW	Sun Microsystems, Inc
-swir	Sierra Wireless
-syna	Synaptics Inc.
+summit		Summit microelectronics
+sunchip		Shenzhen Sunchip Technology Co., Ltd
+SUNW		Sun Microsystems, Inc
+swir		Sierra Wireless
+syna		Synaptics Inc.
 synology	Synology, Inc.
-tbs	TBS Technologies
-tcg	Trusted Computing Group
-tcl	Toby Churchill Ltd.
+tbs		TBS Technologies
+tcg		Trusted Computing Group
+tcl		Toby Churchill Ltd.
 technexion	TechNexion
 technologic	Technologic Systems
-terasic	Terasic Inc.
-thine	THine Electronics, Inc.
-ti	Texas Instruments
-tianma	Tianma Micro-electronics Co., Ltd.
-tlm	Trusted Logic Mobility
-topeet  Topeet
-toradex	Toradex AG
-toshiba	Toshiba Corporation
-toumaz	Toumaz
-tpk	TPK U.S.A. LLC
-tplink	TP-LINK Technologies Co., Ltd.
-tpo	TPO
-tronfy	Tronfy
+terasic		Terasic Inc.
+thine		THine Electronics, Inc.
+ti		Texas Instruments
+tianma		Tianma Micro-electronics Co., Ltd.
+tlm		Trusted Logic Mobility
+topeet  	Topeet
+toradex		Toradex AG
+toshiba		Toshiba Corporation
+toumaz		Toumaz
+tpk		TPK U.S.A. LLC
+tplink		TP-LINK Technologies Co., Ltd.
+tpo		TPO
+tronfy		Tronfy
 tronsmart	Tronsmart
-truly	Truly Semiconductors Limited
-tsd	Theobroma Systems Design und Consulting GmbH
-tyan	Tyan Computer Corporation
+truly		Truly Semiconductors Limited
+tsd		Theobroma Systems Design und Consulting GmbH
+tyan		Tyan Computer Corporation
 ucrobotics	uCRobotics
-udoo	Udoo
-uniwest	United Western Technologies Corp (UniWest)
-upisemi	uPI Semiconductor Corp.
-urt	United Radiant Technology Corporation
-usi	Universal Scientific Industrial Co., Ltd.
-v3	V3 Semiconductor
+udoo		Udoo
+uniwest		United Western Technologies Corp (UniWest)
+upisemi		uPI Semiconductor Corp.
+urt		United Radiant Technology Corporation
+usi		Universal Scientific Industrial Co., Ltd.
+v3		V3 Semiconductor
 variscite	Variscite Ltd.
-via	VIA Technologies, Inc.
-virtio	Virtual I/O Device Specification, developed by the OASIS consortium
-vivante	Vivante Corporation
-vocore VoCore Studio
-voipac	Voipac Technologies s.r.o.
-wd	Western Digital Corp.
-wetek	WeTek Electronics, limited.
-wexler	Wexler
-winbond Winbond Electronics corp.
-winstar	Winstar Display Corp.
-wlf	Wolfson Microelectronics
-wm	Wondermedia Technologies, Inc.
+via		VIA Technologies, Inc.
+virtio		Virtual I/O Device Specification, developed by the OASIS consortium
+vivante		Vivante Corporation
+vocore		VoCore Studio
+voipac		Voipac Technologies s.r.o.
+wd		Western Digital Corp.
+wetek		WeTek Electronics, limited.
+wexler		Wexler
+winbond 	Winbond Electronics corp.
+winstar		Winstar Display Corp.
+wlf		Wolfson Microelectronics
+wm		Wondermedia Technologies, Inc.
 x-powers	X-Powers
-xes	Extreme Engineering Solutions (X-ES)
+xes		Extreme Engineering Solutions (X-ES)
 xillybus	Xillybus Ltd.
-xlnx	Xilinx
-xunlong	Shenzhen Xunlong Software CO.,Limited
-zarlink	Zarlink Semiconductor
-zeitec	ZEITEC Semiconductor Co., LTD.
-zidoo	Shenzhen Zidoo Technology Co., Ltd.
-zii	Zodiac Inflight Innovations
-zte	ZTE Corp.
-zyxel	ZyXEL Communications Corp.
+xlnx		Xilinx
+xunlong		Shenzhen Xunlong Software CO.,Limited
+zarlink		Zarlink Semiconductor
+zeitec		ZEITEC Semiconductor Co., LTD.
+zidoo		Shenzhen Zidoo Technology Co., Ltd.
+zii		Zodiac Inflight Innovations
+zte		ZTE Corp.
+zyxel		ZyXEL Communications Corp.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
