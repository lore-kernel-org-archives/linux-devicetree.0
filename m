From: Yoshiyuki Ito <yoshiyuki.ito.ub@renesas.com>
Subject: Re: [PATCH 00/10] pinctrl: mvebu: remove hard-coded addresses from
 Dove pinctrl
Date: Fri, 7 Mar 2014 11:57:09 +0900
Message-ID: <20140307.115709.525573020409548427.yoshiyuki.ito.ub@renesas.com>
References: <1393231382-11078-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<20140224181023.GA1010@titan.lakedaemon.net>
	<CACRpkdZ+YGTyDj6i8c198MdRtz3GY-YBmVO9LysPCcmT4EC0cg@mail.gmail.com>
	<20140226000940.GF1872@titan.lakedaemon.net>
	<CACRpkdYQa2BG_qxf5zY=7rks6O31ZF-BX0af3_u1MOgwfwxFSQ@mail.gmail.com>
	<20140226145345.GG1872@titan.lakedaemon.net>
	<CACRpkdZRJG-TzN4c3NSH9PqcQzpo6EbEn5_bM-P3sh4_vSjtaA@mail.gmail.com>
	<20140307021633.GN1872@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140307021633.GN1872@titan.lakedaemon.net>
Sender: linux-doc-owner@vger.kernel.org
To: jason@lakedaemon.net
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, andrew@lunn.ch, linux@arm.linux.org.uk, pawel.moll@arm.com, linux-doc@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org


To: 渡辺さん、宗像さん

伊藤(義)です。

AGL、現状で公開されているもの、これから調べます。

L.F.のボードメンバーは、web上、以下のように掲載されていました。

Larry Augustin -- Individual Member Representative
James Bottomley, Technical Advisory Board Member
Mark Charlebois, Qualcomm Innovation Center, Inc. (QuIC)
Alan Clark, SUSE
Wim Coekaerts, Oracle
Yoshiya Eto, Fujitsu
Eileen Evans, Hewlett-Packard
Frank Fanzilli
Doug Fisher, Intel
Dan Frye, IBM
Bdale Garbee, Individual Member Representative
Hisashi Hashimoto, Hitachi
KIM Myung-Joon, ETRI
Young Yoon Kim, Samsung Electronics
Mark Lee, Splashtop
Tsugikazu Shibata, NEC

LFのメンバ企業ですが、メンバーリストを公開しているページは、
logoが並んでいるだけなので、各社のURLを抜き出しました(アル
ファベット順です)。

プラチナが、富士通、HP、IBM、INTEL、NEC、オラクル、Qualcomm、
サムスン

ゴールドが、チャイナモバイル、CISCO、Citrix、ETRL、Google、
日立、Huawei、Netapp、NYSEテクノロジーズ、パナソニック、
SuSE、トヨタ


Platinum Members
www.fujitsu.com
www.hp.com
www.ibm.com
www.intel.com
www.nec.com
www.oracle.com
www.quicinc.com
www.samsung.com

Gold Members
www.chinamobileltd.com
www.cisco.com
www.citrix.com
www.etri.re.kr
www.google.com
www.hitachi.com
www.huawei.com
www.netapp.com
nysetechnologies.nyx.com
www.panasonic.com
www.suse.com
www.toyota.com

Silver Members
www.4linux.com.br
www.6wind.com
www.aavamobile.com
www.aboveit.nl
www.adeneo-embedded.com
www.adobe.com
www.advancedtelematic.com
www.aisin-aw.co.jp
www.allgosystems.com
www.amarulasolutions.com
aws.amazon.com
www.amd.com
www.antelink.com
www.arm.com
www.ashisuto.co.jp
www.autonomicresources.com
www.axis.com
www.bn.com
www.basyskom.com
www.blackducksoftware.com
www.bloombase.com
www.bluecatnetworks.com
www.borqs.com
www.brightone.de
www.broadcom.com
www.bromium.com
www.bt.com
www.bull.com
www.ca.com
www.calix.com
www.calxeda.com
www.canonical.com
www.caviumnetworks.com
www.cdac.in
www.chelsio.com
www.cinemo.com
www.cloudius-systems.com
www.cloudscaling.com
www.cloudsigma.com
www.cloudsoftcorp.com
www.cme.com
www.codero.com
www.codethink.co.uk
www.collabora.co.uk
www.comarch.com
www.componentality.com
www.credativ.com
www.csr.com
www.cybercom.com
www.cypress.com
www.dlink.com
www.dotrtt.com
www.dell.com
www.globaldenso.com
www.denx.de
www.dfs-ais.de
www.docker.io
www.dreamhost.com
www.dreamworks.com
www.emc.com
www.enea.com
www.epson.com
www.erlang-solutions.com
www.eucalyptus.com
exegy.com
feuerlabs.com
www.fixnetix.com
www.fluendo.com
www.freescale.com
www.fusionio.com
www.gazzang.com
www.genymobile.com
gsmart.gigabytecm.com
www.goahead.com
www.harman.com
www.hgst.com
www.hisense.com
www.hostconcepts.com
hsafoundation.com
www.hyundai.com
www.ics.com
www.igalia.com
www.inktank.com
www.innominds.com
www.interactivedata.com
www.intrinsyc.com
www.ixonos.com
www.jaguarlandrover.com
www.jpmorgan.com
www.jvckenwood.com
adaptxt.com
www.lanedo.com
www.lexisnexis.ca
www.lexmark.com
www.lg.com
www.lineo.co.jp
www.linpus.com
www.lpi.org
www.lsi.com
www.mandriva.com
www.marvell.com
www.meinbergglobal.com
www.mellanox.com
www.mentor.com
www.meyersound.com
www.micware.co.jp
www.mindspeed.com
www.mips.com
www.mocana.com
www.nebula.com
www.nexb.com
www.nicira.com
www.nipa.kr
www.nissan-global.com
www.nixu.com
www.nokia.com
www.ntt.co.jp
nttd-mse.com
nvidia.com
www.osssystems.com
www.omnibond.com
www.op5.com
www.openlogic.com
www.osadl.org
owncloud.org
www.palamida.com
www.parallels.com
www.pelagicore.com
www.perforce.com
www.pingwinsoft.ru
pioneer.jp
www.produban.com
www.profusion.mobi
www.protecode.com
www.proxmox.com
www.pt.com
www.puzzle.ch
www.atheros.com
reaktor.fi
www.redhat.com
www.renesas.com
www.ricoh.com
rusbitech.ru
www.savoirfairelinux.com
www.scalecomputing.com
www.servergy.com
www.siemens.com
www.sim.com
www.softlayer.com
www.solarflare.com
www.sonatype.com
www.sony.com
www.spectracoretech.com
www.splashtop.com
www.stericsson.com
www.stec-inc.com
www.suntec.net
www.superb.net
www.symbio.com
www.symphonyteleca.com
www.synopsys.com
www.systena.co.jp
www.ti.com
www.ramsan.com
www.thomas-krenn.com
www.thundersoft.com
www.tieto.com
www.timesys.com
www.toshiba.com
www.toyotsu-electronics.co.jp
www.travelping.com
www.ts-a.com
www.turbosystems.co.jp
www.tuxera.com
twitter.com
www.valvesoftware.com
www.via.com
www.vbridges.com
www.vmware.com
www.wargaming.net
www.windriver.com
www.yahoo.com
www.zenoss.com
wwwen.zte.com.cn

Affiliates
www.cicc.or.jp
www.konkuk.ac.kr
www.oamk.fi
www.senecac.on.ca
www.soongsil.ac.kr
trace.wisc.edu
