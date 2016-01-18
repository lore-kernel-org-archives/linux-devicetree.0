From: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/6] QE: Add uqe_serial document to bindings
Date: Mon, 18 Jan 2016 17:10:00 +0800
Message-ID: <CADRPPNS3qT+=zz60UKRSYwxpaphcE7e04SntOQ==RjoOfhQ68Q@mail.gmail.com>
References: <1452219494-31947-1-git-send-email-qiang.zhao@nxp.com>
	<1452219494-31947-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452219494-31947-3-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 8, 2016 at 10:18 AM, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org> wrote:
> Add uqe_serial document to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

As you have submitted patch to move QE code from arch/powerpc into
drivers/soc/fsl for the reuse of ARM and powerpc,  you should also
move the binding documents out of the powerpc folder into a more
common place and add new bindings in the new location.

Regards,
Leo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
