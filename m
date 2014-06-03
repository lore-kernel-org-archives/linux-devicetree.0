From: Pacman du34 <pacmandu34-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: FATAL ERROR: Unable to parse input tree
Date: Tue, 3 Jun 2014 14:53:24 +0200
Message-ID: <CAPH+8+gzCmV=tZOhq3DhYfWo6Pngcj+9XW3gNgCTV+qq5HnJ_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello all,

I am working on a new Linux port to a new architecture and I would like
to add a dts file to describe my system.

So first of all I wrote the following dts test file :

/ {
    compatible = "manufacturer,cpu";
};

I've read that this is the minimum structure required for a device tree
on the wiki.

But when I try compiling it with dtc (the first line is the command
line) I get this error message :

dtc -I dts -O dtb -o my_file.dtb myfile.dts

Error: myfile.dts:1.1-2 syntax error
FATAL ERROR: Unable to parse input tree

I tried both the dtc version of Linux source code (1.2.0-g37c0b6a0) and
dtc version installed with "apt-get install device-tree-compiler" (1.3.0).

I searched on Google but I have not found relevant information for my issue.

I really do not understand what the problem here and I am totally stuck.
Any help will be appreciated.

Thanks a lot in advance.

Best regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
