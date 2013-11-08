Return-Path: <qsyousef@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1381163377-21044-9-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
	<1381163377-21044-9-git-send-email-robherring2@gmail.com>
Date: Fri, 8 Nov 2013 11:39:29 +0000
Message-ID: <CA+mqd+4s8_8GSfxe0j2ftdSscbwJHkasg2njvbwga12uUTO3Bg@mail.gmail.com>
Subject: Re: [PATCH v2 08/29] metag: use unflatten_and_copy_device_tree
From: Qais Yousef <qsyousef@gmail.com>
Content-Type: multipart/alternative; boundary=089e0111bca4cf2d5d04eaa8d526
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, James Hogan <james.hogan@imgtec.com>
List-ID: <devicetree@vger.kernel.org>

--089e0111bca4cf2d5d04eaa8d526
Content-Type: text/plain; charset=ISO-8859-1

should remove extern void copy_fdt(void) declaration from prom.h too as you
removed the definition and the only user.

--089e0111bca4cf2d5d04eaa8d526
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra">should remove extern void copy_fdt(void) declaration from prom.h too as you removed the definition and the only user.<br></div></div>

--089e0111bca4cf2d5d04eaa8d526--
