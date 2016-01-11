From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] USB: core: let USB device know device node
Date: Mon, 11 Jan 2016 18:04:27 +0800
Message-ID: <201601111855.RTgXWRmJ%fengguang.wu@intel.com>
References: <1452501535-8580-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452501535-8580-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v4.4 next-20160108]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Peter-Chen/USB-core-let-USB-device-know-device-node/20160111-164533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

>> include/linux/usb.h:621: warning: No description found for parameter 'of_node'

vim +/of_node +621 include/linux/usb.h

151230068 Sarah Sharp          2007-12-21  605  
645daaab0 Alan Stern           2006-08-30  606  #ifdef CONFIG_PM
f476fbaba Randy Dunlap         2008-02-13  607  	unsigned long connect_time;
f476fbaba Randy Dunlap         2008-02-13  608  
f476fbaba Randy Dunlap         2008-02-13  609  	unsigned do_remote_wakeup:1;
f476fbaba Randy Dunlap         2008-02-13  610  	unsigned reset_resume:1;
bfd1e9101 Alan Stern           2012-10-19  611  	unsigned port_is_suspended:1;
645daaab0 Alan Stern           2006-08-30  612  #endif
b1d8dfb0e Inaky Perez-Gonzalez 2008-04-08  613  	struct wusb_dev *wusb_dev;
c6515272b Sarah Sharp          2009-04-27  614  	int slot_id;
0846e7e98 Matthew Garrett      2012-02-03  615  	enum usb_device_removable removable;
17f34867e Mathias Nyman        2013-05-23  616  	struct usb2_lpm_parameters l1_params;
51e0a0120 Sarah Sharp          2012-02-20  617  	struct usb3_lpm_parameters u1_params;
51e0a0120 Sarah Sharp          2012-02-20  618  	struct usb3_lpm_parameters u2_params;
1ea7e0e8e Sarah Sharp          2012-04-24  619  	unsigned lpm_disable_count;
9d9d6644d Peter Chen           2016-01-11  620  	struct device_node	*of_node; /* associated device tree node */
^1da177e4 Linus Torvalds       2005-04-16 @621  };
^1da177e4 Linus Torvalds       2005-04-16  622  #define	to_usb_device(d) container_of(d, struct usb_device, dev)
^1da177e4 Linus Torvalds       2005-04-16  623  
1e429018b Matthew Wilcox       2010-04-30  624  static inline struct usb_device *interface_to_usbdev(struct usb_interface *intf)
1e429018b Matthew Wilcox       2010-04-30  625  {
1e429018b Matthew Wilcox       2010-04-30  626  	return to_usb_device(intf->dev.parent);
1e429018b Matthew Wilcox       2010-04-30  627  }
1e429018b Matthew Wilcox       2010-04-30  628  
^1da177e4 Linus Torvalds       2005-04-16  629  extern struct usb_device *usb_get_dev(struct usb_device *dev);

:::::: The code at line 621 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds-gWtpgVMusWVb5UGfqNBoRg@public.gmane.org>
:::::: CC: Linus Torvalds <torvalds-gWtpgVMusWVb5UGfqNBoRg@public.gmane.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--fdj2RfSjLxBAspz7
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICLt5k1YAAy5jb25maWcAjFzdc9u2sn8/fwUnvQ/tzE3i2I6bzh0/QCAoouJXCFCS/cJR
ZDrR1JZ8JLlN/vu7C5Di10LpmemcGLsAgcXubz8A6Jf//OKx1+PueXXcrFdPTz+8r9W22q+O
1YP3uHmq/s/zUy9JtSd8qd8Bc7TZvn5/v7n6dONdv7t+d/F2v/7dm1X7bfXk8d32cfP1FXpv
dtv//ALcPE0COS1vridSe5uDt90dvUN1/E/dvvx0U15d3v7o/N3+IROl84JrmSalL3jqi7wl
poXOCl0GaR4zffumenq8unyLs3rTcLCch9AvsH/evlnt19/ef/90835tZnkwaygfqkf796lf
lPKZL7JSFVmW5rr9pNKMz3TOuBjTQjYXZcS0SPidTonOcVy0fyRC+KWaln7MykgkUx22tKlI
RC55KRVD+pgQLoSchp2hzUJjdmcnkfEy8HlLzRdKxOWSh1Pm+yWLpmkudRiPx+UskpMclgBC
i9jdYPyQqZJnRZkDbUnRGA9BAjIB4ch7MZCMErrIykzkZgyWCzYQRkMS8QT+CmSudMnDIpk5
+DI2FTSbnZGciDxhRnWyVCk5icSARRUqE4nvIi9YosuwgK9kMexVCHOmOIzwWGQ4dTQZfcNo
gSrTTMsYxOKDUoOMZDJ1cfpiUkzN8lgEmtgzDTAV0LH7u3Kqhuu1OlHyIGJAfPP2EW357WH1
d/Xwtlp/9/oND9/f0F8vsjydiM7ogVyWguXRHfxdxqKjNtlUMxAb6O9cROr2smk/WRwogwLL
fP+0+fL+effw+lQd3v9PkbBYoBIJpsT7dwPTk/nncpHmnd2cFDLyQXaiFEv7PWXNyqDL1EDV
EyLK6wu0NJ3ydCaSEmas4qyLJ1KXIpnDmnFysdS3V6dp8xz0oORpnEnQhTdvWuyq20otFAVh
sEksmotcga71+nUJJSt0SnQ2xjEDVRVROb2X2cBsasoEKJc0KbrvQkSXsrx39UhdhOuW0J/T
aU3dCXWXM2TAaZ2jL+/P907Pk68JUYLesSICm02VRiW7ffPrdretfuvsiLpTc5lxcmy7/6Dh
aX5XMg1QH5J8QcgSPxIkrVACINS1zcbSWAFuFOYBqhE1Wgxa7x1evxx+HI7Vc6vFJ0cARmHM
kvARQFJhuujoOLSAT+SANDoEmPV7UKMyliuBTG0bR3+n0gL6AKRpHvrpEJy6LD7TjO48B//h
o/uIGKLyHY+IGRtTnrcCGPogHA8AJdHqLLGMJdiU/2ehNMEXp4hkOJdGxHrzXO0PlJTDe/Qp
MvUl7yp6kiJFunbakElKCDgM+KbMSnPV5bEBUVa816vDX94RpuSttg/e4bg6HrzVer173R43
26/t3LTkM+swOU+LRNu9PH0K99rIsyWPPpfzwlPjVQPvXQm07nDwJ4AsCINCOTVg1kzNFHYh
hYBDQbQURQiecZqQTDoXwnCakMo5Dk4JbEaUkzTVJJfxEeVEJpe0acuZ/YfLMAuIM61rgRDG
t2rWXSuf5mmRKRo2QsFnWSohFIBN12lOL8SOjE7AjEUvFqMueoHRDOBtbhxY7tPz4KcYA+3f
xGDEelkCvkgmEEqrgRMopP+hE3ujheoIhM9FZqIos0mDPhlX2SwvM4h7MQ5vqVaNujKMAZol
4GNOiweCpxg0qqyBgWa6U4E6yzEDgrqL6Z3KctikmUOBpnSX/vrovhDHlEHhmFFQaLEkKSJL
XeuU04RFAb3PBlUcNAONDtokC84LNwTXR1KYpJ0x8+cSll4PSsscN9x4Zces4JsTlueyrxbN
cjAV8IU/VDoYsjy5CANydfaZVfvH3f55tV1Xnvi72gKqMsBXjrgK6N+iX3+I02zq0BuJMPFy
HpsInJz4PLb9SwO8A5zvRY5MQzhKq52KGBUsqKiYdKelonTiMggNqR165BLiTBlIbjIeh/qn
gYwGLqIr19RydGy8aSmTWFrF607rzyLOwNVPBK1QdSZB+0j8nikJQD4K2o7QyLlQyjU3EcDa
JMob8odej0GkgvuG7gD8WzlRCzYMqCUAdMwylMYweZ8NUx/bmgtNEgBt6Q62FZOPgMJMM01D
CNN0NiBiPQBiz3w4KLbD31pOi7QgIiNIc0ysUsd8RKIKieUdRMUYgRmcNYWVwVdyMVXgIXxb
6KgFXLJMUrPMpLWXAS1cgLoLZl3igBbLJexbS1bmi0M/BJAB7brIE4iyNCh1t+ozRABUTYpK
DNzYdV4vzy/ioXYYabV6PapyzK0pKBYICDIzrKkMR6iV08rXpPEDjrqfzQ4dND8tHAUJyF5K
G8M3GSexAiU4Ig/k7pEeCQ8CBbN+tADBIWDpRTpDImGQIx7YpkScHQW3o4gY7fvH3CC81I1T
RNTrMLEE0x1Rl3H6WxGnfhGBlSJeiAj1ZbzbylLAINJ4XNHiaXZXm1upo46yQfiYAAjBihYs
9zuEFIJU8O113elqRGCm0nkqbfB0/vbL6lA9eH9Z9/ay3z1unnoJwmmmyF02cN3LrMxkG5yw
OBIKlEqnxoIhjEJvd/uh45utiIhtaIRnAvgIUKzo1QgmGD8T3UzlCz6UATYXCTL1E9GabiRq
6edoZN9FjomCo3OX2O/dr4ExnSJO5vFiwIHK8rkQBdo3LMKkvm6WfNEwtNEgCOy+H+uYvc72
u3V1OOz23vHHi00KH6vV8XVfHbpF9HtULN9RWAEXQLZj2TAQDPAUwIvFDo+MXGKpQS+xxnou
3q3LkDKX9Eg20wEJalgu1voM1Dvi/vAOUBnCSDD6aUGX1yDTxsTPlh5b5bz+dENHlB/PELSi
ozmkxfGSUvUbcyDRcoLpQh4TS0kPdCKfp9OibajXNHXmWNjsd0f7J7qd54VK6TQ1NoGWcISQ
8UImPAQX5JhITb5yxfoRc4w7FZCQTpcfzlDLiE6jYn6Xy6VT3nPJ+FVJlyoN0SE7DnGioxfC
g9MyaqB1nHQZQ8Dkuz4tUaEM9O3HLkv0YUDrDZ8BxIM1J5zK7ZEB8ccwmbqEKjo5OZLBAPoN
dcRxcz1sTuf9llgmMi5iU40KII6M7vrzNrEg11GsegEFTAWDSHTqIgLvTsUTMCJgrxFOx281
zWZ/e2eEDYXFPsEOJsSKfEww8UAsIFWixipibttbaMqEtkkPudl+LCmwModTCtzoaf1CxJke
hUhN+zyNIIRhOV33qbmc2oZCyCSNaWbTHGU1o2gCAo47SGQdeOkk6BRUc0I7IfmJznTxg7lA
HA/k0lVKMzNWtLiNUmaFpKElSbHqOihgNPtoKde9ymndeHNNRZnzWGURuK+rXpe2FVM/h8gs
yyVdTWrJPx3hAzUvc+SZBoES+vbiO7+w/xuscxCPBODKobUUCSNOQE0m4SYbi22ORCDo65qn
jFCBosa7Y/G/ELen2Zzt20wqZklhcqA2eDjNyNIIKdSd+6OVBlRtv05S1w4HGYaWHeyz+aiI
J/1IsddcD9od0F4pkIpDZN/t3q9s1PEKIFqQmkGoIo/Z50ybDxnMuB7Ujbi7lBPeQZTq+3mp
nRcrmlgRxTNt92Uuc0A1CKmKXmA6U5TpNCdqMVZM7IGLn99eX/xx0y3ij9MsChi7Z/ezXijH
I8ES4/Po9NAR795naUpXnu4nBQ0T92pc0atJTYJkjrqbKpH7iD4Qed7P8k1tfggxmXbjr3HQ
5USmeOic50U23O4edCoIkzHXWtzedPQk1jkNl2a+NnN1TgCE4c4YjDOGgJQOuuoCAx3S35cf
Li4oIL4vLz9e9ER0X171WQej0MPcwjDDfCPM8ayMPhQQS+E68mUqNHUgCm3ByCQHhAPoyBFw
P9R42z2vSTkzJ0fn+puSEPS/HHSvi8NzX9H1dR77Jm2duPQcUFUGd2Xka6qy39UEC+8NGoep
ziJTuLPJ5+6fau89r7arr9VztT2a9JPxTHq7F7zG1UtB6+IFDUu0rqmgFyk1h6BesK/++1pt
1z+8w3pVlzXaxWOYmYvPZE/58FQNmZ0ntUYACD/qxIdF+ywS/mjwyeuhWbT3a8alVx3X737r
fgobicqGvapVl0rbaEg5UnWOykCS0shxPQG0iLbFROiPHy/o1Cnj6KjcCHCngslICOJ7tX49
rr48Veb+n2eOVI4H770nnl+fViOVmICbizXWyuiDJ0tWPJcZ5ahsxS4teuBZd8Lmc4PG0pHQ
Y/rmsGv7PVvikalF+a4wR/Lwq78368rz95u/7SFSe/Nos66bvXRsKoU9IApFlLlyCDHXcRY4
6iga4JthLdGVGpjhA5nHC3C/9hCcZA0W4DiY75gEesSFOV2mhDY4G/NzOXcuxjCIee4oMYG2
deo9JMvpAgcYKowkOVl+7HLhiXpzN6aTmzF7Yc8HqQQBUXBDQ38w+9rbsljTEkwDYhr21qW5
ddfcu4Q4qL702e6TbRrNIN4c1tQUYAPiO6xOkhOBzD9KFZbyMCAYyqcVdc5oLOaX5GSEABnG
3uH15WW3P3anYynlH1d8eTPqpqvvq4Mnt4fj/vXZHLcevq321YN33K+2BxzKA1yvvAdY6+YF
/9lYD3s6VvuVF2RTBiCzf/4HunkPu3+2T7vVg2cvCza8cnusnjwwV7Nr1t4amuIyIJrbLuHu
cHQS+Wr/QA3o5N+9nAq16rg6Vl7ces1feari3zow0cqQhw4Pv4xM7d1JrO+7gVtxsggRukBO
+qfrT4orWWtbZ5dP7khJDCZ6iRi2uUrNMeMQH6YYOxk8GF9yktuX1+P4g61nTLJirIYh7IfR
BPk+9bBLP/TAW1r/zg4Na3c5UxYLUvM5KOxqDcpI2aLWdFkGoMl1WQJIMxdNZrEs7e1BRzV8
cS5mT+Yuq874p9+vbr6X08xxVSNR3E2EGU1tMuKudmkO/zniO0gU+PDExyrBJSf33nFLSzm0
XGUxTQjVOLDMMkV9M8vGOopt9VOHnbka2PSyVJ1566fd+q8hQWxNaAThPV71xFgZgga8s4wR
vxEheO44w4sWxx18rfKO3ypv9fCwwQhh9WRHPbwbHOKZ093UJIGQM+BmwfA9FbZNpCQWjvAv
XeBpN6StkaO+aBjY3HFLY+G8uReKPGZ0VtJcIaVqHmrSvW1vkWm33awPnto8bda7rTdZrf96
eVpte/E99CNGm3Bw88PhJntwIOvds3d4qdabRwjQWDxhvXB1UFCw3vj16bh5fN2ucY8a3HoY
Q3kc+CZMomERiTnk8450M9QYIUBSeOXsPhNx5ojikBzrm6s/HCcWQFaxKxFgk+XHi4vzU8cc
0nXwA2QtSxZfXX1c4iEC8x0HacgYO4DGXgLQjtgvFr5kTY1ltEHT/erlGyoKYdx+/6TSkIL9
6rnyvrw+PgK0+2NoD2hDwlP7yLiSiPvUZNpK7ZRhTdFx2zMt+jlykxKAAaQhl2UktYY8FDJp
yTpXOJA+ejiEjadz/pD33HShxvkbtpnY66GfsWB79u3HAV95edHqB/q8sYbj1wDIHGX2zNCX
XMg5yYHUKfOnghZasaDFHscOdRKxctZ1EgF5DaT1tMKbu0tyIkHSd8ROCJ/xJguE1LToPNwx
pHYX2jAO2omRcrDqAVRjE4+YoqcGURWR27QzL5a+VJnrKnDhMC5T2HWFY/PNHoCN2m7sJlPY
gP6wdYqy3u8Ou8ejF/54qfZv597X1wrCacIEwRSmg6uFvUpDc6OAyuracDaEVEOceMfLOMWH
6mWzNb55oOLcNKrd674H38340UzlkPR/uvzYuXwDrZCGE62TyD+1trujYwjIM0nrN0TEJoYq
efwThlgX9PHyiUPH9NV6EdcMYBmO6FxGk5QuFsk0jgsnyObV8+5YYY5DqYrSwhzkxGWOp7rj
3i/Ph6/DHVHA+Ksyjw+8dAvh9ublt9Y3E8mSKpKldCewMF7pWHdmtGtYNGzlttRO92bqorTA
HOaWLVwxPl4tnBS0hmMdX5uLnHkaubKAIB7LFhG5+4pjVDFxQTbGpNmSlZefkhgDZhpne1yA
4bRqQuRUziA8NRxnvxjKm8vLi6F36oed3HH6EPOxS+te7H6GgBECdgqFcjbGDLZ92O82D102
SLHy1HWS7MzslHa226KNk1o/j4IWlTqK1Pa4RYej6ZsKSe9VNejBaOGGa9S1qatQJQnfUSps
qokgBdfxkC+iqMwnNDr53J8wWvmnaTqNxOkTxHwhrbIa3gFt396GgQSrc+O7na/CDEAugeR4
f4H3ITE7dXmnQJlLxo5E/wxNWlrpfNMSsDO9PxepposrhsI1vRwsdwbqunTUjAO8/uOgpRAZ
QFAxIFulWK2/DcJjNTqQtYZ4qF4fduZcoN2p1q7BLbg+b2g8lJGfCxqFsdjlqoXjyx86p7LP
rs9Ty+GhdBtymP8DLXIMgAcMRofsUwuaKYnGIq1fpHyDdLb/os/8eoDMP5t32p0w0/R62W+2
x79MUeHhuQJv2p7AnVyVUnjaHKEtzQEz6jP62+t6K3fPL7A5b83jQtjV9V8HM9zatu+pMz1b
ucfLCrTjtIeHYLP4KwxZLjikPY4HSPU5Y2Fe5QvyFrC9FIqj3X64uLzuQmUus5IpAEzXEy68
/mu+wBQNxkUCFoCpbDxJHU+S7C2aRXL2GCOgzh1CgYcoyq5s/G5ICftLFaAzMdZAaE0eMFmx
pklEJSltYah3k3Zwpfhnd2zrFaXmfa9gs+YahiN4nGJGdKf6BxC9oWxVutHZGILG/Q/Isb+8
fv06OMU1sjbXipXrLsvg5w7O8KSTP0F4zidC9dzAcUWwyPH2NJQzX7DvQgrlQgvLNXdVfg0R
8qnCURmzHPUhPF4XOcN15j5bu1gzX8T1IDJPwKnlNGTXSEbHUDYjrT41npNYODipqk9MQRe8
CHKx1xcLP+Fq+7WHOeiSiwxGGT8z6XwCiQDiiX1u7DDnBBQWLCpNM0o3evThLTVLxHQKz59H
l0qckGjJVl3wJ0R+Jib8wkyIjHqgjWJqrcf79VDntof/9Z5fj9X3Cv6B1xDe9S8i1PKvnyGc
0zd8gerIuC3HYmGZ8KHhImOaRi7La66ruS0VvPz8fLxlBsDK2ZmPNHWZCET2k7nAZ8xTNCWi
AH+fg16n+SiomXkEMfwZj24Ro/55nzMfnVkYOjct6Ri/hjr5Mw5FS84Smydx5zaU58LHlwSM
CEzwxT6N1WbrXA/66x+OwPf453zNT2Vsnvv/K6bzvwnwuf6hHDogq2VUijxPczDjP4X7MqW9
4kjydN0wFl8bWIWEW9uXhOYRmL1qT+EvyUh8oX2VeO7XpYIi4e1T/OG7vhN1mrMs/Fc8QWb2
YPi6s34nSr5e7RPLhdQh9dayJsfmgR4wcEjfBiz1lTU7UfscdPjCru5oR2mJ2APtnqjRBiO1
sUqPP6wBAbGuDseB2qMAjEGa3xWi6x7tvuCDQLfaTsyDOCfdwtrN9QmsaBPCCYVi6byJYxhQ
t5JpfbmIxgLDNwNG7SgGGgbzqwj0zS1Dz0HxQ9cdR/vDG37KVd778ZTeA2H32IXv/MULiD3c
OM3ijH6Y2Ilopn6vJI9/O0DfGOmZI32sX0MQNUmVvdnt+PUOe3P4zI9MmDq4xm11n8O1PGfg
PU/xxT/NYB4OG0g7F45AwhwVivbzdYkYVNn9HB+PCxxIJVP763GlvstEebH8dNGGW//fx7Xt
NgjD0F9axxdAAM0bQgjSavSl2qY+9KkSWh/297MdyIXaeeUYCCTEF3zOHmvqQJRJMbcygqZY
ijKZpnjC+GZx+2UAlHzVW2RWorfpd614/pWuHiQeYhxLmqHMfAhetGXThcvMG/p0pUztGVgr
0YF7496UQlwwbpUscDiSUhrtV88jd2X9689juf3+SeWEj2ZWqjiNOY5gZ9wemomL4fztZW3F
RHx75eGCZUTt2KOplts4DxkhtlPCTFiTOTjrqhoV9OU4C7uoi+1v38sXJsfL/YF+5xrVcbxw
gx17g6FBS112FAYI2g5o0jW9grbQb3KJFQhaWIMB3+a6g9TDAhO+JUkv1vAZOkh1QMyIy82A
lScS0YPMI6Pz7OGlBtn7EAwWA0ENLeS/FIjIHRIdVHyWxgUwMl2WBdtWGTTXsS9wPEMMwP1b
xWvex3+eSc80A10q8y4u0olmLWY/uUO0B6dMJY5XY2lAP5U+DKH7QMsFdAunVMEBwy7lCeta
k3BynKZcAD3RT94SemFU5FIu7JUQ/AeWwfn+lFYAAA==

--fdj2RfSjLxBAspz7--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
