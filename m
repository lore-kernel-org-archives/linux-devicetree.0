Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16897C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 05:37:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D526F206D3
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 05:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="GzhS+DwH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfLIFhM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 00:37:12 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:14064 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfLIFhM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 00:37:12 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47WX4x3wfVz9v6RT;
        Mon,  9 Dec 2019 06:37:05 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=GzhS+DwH; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id iB1Z137g_8ck; Mon,  9 Dec 2019 06:37:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47WX4x2Ccpz9v6RS;
        Mon,  9 Dec 2019 06:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1575869825; bh=FEaKJXbXjOZ1lXq1C/Q2UlBfDCkQh9ayeBwDENy5BRg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GzhS+DwHmvcH7W0kx9/VDg8rH//PkeuA5gm9WiyQKP6X5IuU8WLySJ0Y45zfEKN53
         MxN/37bQh9VhThRUzXfCuA5ZbNpmiEL8Bq9aPGzYggZBvIaeMlHiE88lB63mQINyA4
         HacB28XxQpEZuPIshNaU3cWXTW9h2ZYOK3uGtVr4=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B1EF48B789;
        Mon,  9 Dec 2019 06:37:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id z_yjYl-8tdf1; Mon,  9 Dec 2019 06:37:09 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B3758B755;
        Mon,  9 Dec 2019 06:37:09 +0100 (CET)
Subject: Re: [PATCH V2 00/13] powerpc/vas: Page fault handling for user space
 NX requests
To:     Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
        hch@infradead.org, mikey@neuling.org, npiggin@gmail.com,
        herbert@gondor.apana.org.au, linuxppc-dev@lists.ozlabs.org,
        devicetree@vger.kernel.org
Cc:     sukadev@linux.vnet.ibm.com
References: <1575861522.16318.9.camel@hbabu-laptop>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8ba807dd-9d5a-e42a-60e8-f9ad648026bf@c-s.fr>
Date:   Mon, 9 Dec 2019 06:37:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575861522.16318.9.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

What do you mean by NX ?
Up to now, NX has been standing for No-eXecute. That's a bit in segment 
registers on book3s/32 to forbid executing code.

Therefore, some of your text is really misleading. If NX means something 
else for you, your text must be unambiguous.

Christophe

Le 09/12/2019 à 04:18, Haren Myneni a écrit :
> 
> Applications will send compression / decompression requests to NX with
> COPY/PASTE instructions. When NX is processing these requests, can hit
> fault on the request buffer (not in memory). It issues an interrupt and
> pastes fault CRB in fault FIFO. Expects kernel to handle this fault and
> return credits for both send and fault windows after processing.
> 
> This patch series adds IRQ and fault window setup, and NX fault handling:
> - Read IRQ# from "interrupts" property and configure IRQ per VAS instance.
> - Set port# for each window to generate an interrupt when noticed fault.
> - Set fault window and FIFO on which NX paste fault CRB.
> - Setup IRQ thread fault handler per VAS instance.
> - When receiving an interrupt, Read CRBs from fault FIFO and update
>    coprocessor_status_block (CSB) in the corresponding CRB with translation
>    failure (CSB_CC_TRANSLATION). After issuing NX requests, process polls
>    on CSB address. When it sees translation error, can touch the request
>    buffer to bring the page in to memory and reissue NX request.
> - If copy_to_user fails on user space CSB address, OS sends SEGV signal.
> 
> Tested these patches with NX-GZIP support and will be posting this series
> soon.
> 
> Patch 2: Define nx_fault_stamp on which NX writes fault status for the fault
>           CRB
> Patch 3: Read interrupts and port properties per VAS instance
> Patch 4: Setup fault window per each VAS instance. This window is used for
>           NX to paste fault CRB in FIFO.
> Patches 5 & 6: Setup threaded IRQ per VAS and register NX with fault window
> 	 ID and port number for each send window so that NX paste fault CRB
> 	 in this window.
> Patch 7: Reference to pid and mm so that pid is not used until window closed.
> 	 Needed for multi thread application where child can open a window
> 	 and can be used by parent later.
> Patches 8 and 9: Process CRBs from fault FIFO and notify tasks by
>           updating CSB or through signals.
> Patches 10 and 11: Return credits for send and fault windows after handling
>          faults.
> Patch 13:Fix closing send window after all credits are returned. This issue
>           happens only for user space requests. No page faults on kernel
>           request buffer.
> 
> Changelog:
> V2:
>    - Use threaded IRQ instead of own kernel thread handler
>    - Use pswid insted of user space CSB address to find valid CRB
>    - Removed unused macros and other changes as suggested by Christoph Hellwig
> 
> Haren Myneni (13):
>    powerpc/vas: Describe vas-port and interrupts properties
>    powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
>    powerpc/vas: Read interrupts and vas-port device tree properties
>    powerpc/vas: Setup fault window per VAS instance
>    powerpc/vas: Setup thread IRQ handler per VAS instance
>    powerpc/vas: Register NX with fault window ID and IRQ port value
>    powerpc/vas: Take reference to PID and mm for user space windows
>    powerpc/vas: Update CSB and notify process for fault CRBs
>    powerpc/vas: Print CRB and FIFO values
>    powerpc/vas: Do not use default credits for receive window
>    powerpc/VAS: Return credits after handling fault
>    powerpc/vas: Display process stuck message
>    powerpc/vas: Free send window in VAS instance after credits returned
> 
>   .../devicetree/bindings/powerpc/ibm,vas.txt        |   5 +
>   arch/powerpc/include/asm/icswx.h                   |  18 +-
>   arch/powerpc/platforms/powernv/Makefile            |   2 +-
>   arch/powerpc/platforms/powernv/vas-debug.c         |   2 +-
>   arch/powerpc/platforms/powernv/vas-fault.c         | 337 +++++++++++++++++++++
>   arch/powerpc/platforms/powernv/vas-window.c        | 173 ++++++++++-
>   arch/powerpc/platforms/powernv/vas.c               |  77 ++++-
>   arch/powerpc/platforms/powernv/vas.h               |  38 ++-
>   8 files changed, 627 insertions(+), 25 deletions(-)
>   create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c
> 
