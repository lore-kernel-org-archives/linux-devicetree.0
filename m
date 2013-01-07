From: Jon Loeliger <jdl@jdl.com>
Subject: Re: Fix test relying in wrong behavior of is_printable
Date: Mon, 07 Jan 2013 08:30:03 -0600
Message-ID: <E1TsDiF-0001dJ-0g@jdl.com>
References: <1357326968-13124-1-git-send-email-panto@antoniou-consulting.com> <20130106035809.GG4674@truffula.fritz.box> <5B13DF52-26BE-4BA1-8BD7-25863B04A3B6@antoniou-consulting.com> <E1TryU3-0001K5-Iy@jdl.com> <6BBCA320-AB8C-4DE3-BF98-3A77B1E94982@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <6BBCA320-AB8C-4DE3-BF98-3A77B1E94982@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Matt Porter <mporter@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Russ Dill <Russ.Dill@ti.com>
List-Id: devicetree@vger.kernel.org

> Err,
> 
> I can rework and resubmit to remove the comment, but the test doesn't =
> fail:
> 
> > $ make check | grep 'MyBoardName.*-t s.*compatible'
> > fdtget-runtest.sh MyBoardName MyBoardFamilyName -t s label01.dts.fdtget.test.dtb / compatible:	PASS
> >
> 
> As of today's pull.

My build yields:

    $ make check 2>&1 | grep FAIL
    fdtget-runtest.sh 77 121 66 111 97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 108 121 78 97 109 101 0 label01.dts.fdtget.test.dtb / compatible: FAIL Results differ from expected
    *                FAIL:	1

HTH,
jdl
